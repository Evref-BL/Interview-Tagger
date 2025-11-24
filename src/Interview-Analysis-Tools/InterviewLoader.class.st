Class {
	#name : 'InterviewLoader',
	#superclass : 'Object',
	#instVars : [
		'llmApi',
		'model',
		'interview',
		'text',
		'interjections'
	],
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'as yet unclassified' }
InterviewLoader >> allTopicPrompt [

	^ self topicPromptFrom: (model allWithType: ITWTheme)
]

{ #category : 'export' }
InterviewLoader >> buildAssociationsMatrice [

	| dic |
	
	dic := OrderedDictionary new.
	interview associations do: [ :anAssoc |
		dic
			at: anAssoc sentence index
			ifPresent: [ :matchings |
				matchings at: anAssoc topic name asSymbol put: anAssoc matching ]
			ifAbsentPut: [
				{
					(#index -> anAssoc sentence index).
					(#sentence
					 -> (anAssoc sentence printString reject: [ :c | c = $, ])).
					(anAssoc topic name asSymbol -> anAssoc matching) }
					asOrderedDictionary ] ].
	^ dic
]

{ #category : 'prompt' }
InterviewLoader >> buildResponseFormat [

	^ NeoJSONReader fromString: '
	{"type": "json_schema",
      "json_schema": {
        "schema": {
          "properties": {
            "verbatim": {
              "title": "Verbatim",
				  "description": "Le compte rendu mot à mot en cours d''évaluation",
              "type": "string"
            },
            "explaination": {
              "title": "Explaination",
				  "description": "la raison pour laquelle ce verbatim correspond ou non au sujet donné",
              "type": "string"
            },
				"match": {
              "title": "Match",
				  "description": "évaluation correspondante, soit YES, NO ou UNKNOW", 
              "type": "string"
            },
			"topic": {
              "title": "Topic",
				  "description": "le nom du topic donné pour évaluation", 
              "type": "string"
            }
          },
          "required": ["verbatim", "match", "explaination", "topic"],
          "title": "Tagger",
          "type": "object",
          "additionalProperties": false
        },
        "name": "tagger",
        "strict": true
      }}'
]

{ #category : 'recursion' }
InterviewLoader >> collectFrom: anITWSentence SentencesOn: aCollection downto: anInteger [

	(anInteger <= 0 or: [ anITWSentence previous isNil ]) ifTrue: [
		^ aCollection ].
	aCollection add: anITWSentence previous.
	^ self
		collectFrom: anITWSentence previous
		SentencesOn: aCollection
		upto: anInteger - 1
]

{ #category : 'recursion' }
InterviewLoader >> collectFrom: anITWSentence SentencesOn: aCollection upto: anInteger [

	(anInteger <= 0 or: [ anITWSentence next isNil ]) ifTrue: [
		^ aCollection ].
	aCollection add: anITWSentence next.
	^ self
		collectFrom: anITWSentence next
		SentencesOn: aCollection
		upto: anInteger - 1
]

{ #category : 'as yet unclassified' }
InterviewLoader >> createRequestContentForSetence: aSentence [

	| previously next |

	previously :=  (self collectFrom: aSentence SentencesOn: OrderedCollection new downto: 4) sort: [:a :b | a index < b index].
	next := (self collectFrom: aSentence SentencesOn: OrderedCollection new upto: 2) sort: [:a :b | a index < b index].
		
	^ String cr join: { '<CONTEXTE>' . (String cr join: (previously collect:#printString)) . '<VERBATIM>' . aSentence printString . '</VERBATIM>' . (String cr join: (next collect:#printString )) .  '</CONTEXTE>' . self allTopicPrompt }
]

{ #category : 'prompt' }
InterviewLoader >> createRequestContentForSetence: anITWSentence withTopic: anITWTheme [ 
	
	^ String cr join: {
	self promptForSentence: anITWSentence.
	self promptForTopic: anITWTheme.} 
]

{ #category : 'export' }
InterviewLoader >> exportToCSV [
	|associations header export csv csvFile|
	associations := self buildAssociationsMatrice.
	
	header := ('index, sentence, ') , (', ' join: ((model allWithType: ITWTheme) collect: #name)) .
	export := OrderedCollection new add: header; yourself. 
	
	
	export addAll: ( associations values collect: [ :entry | 
		|output|
		output := (', ' join: entry values). 
		 ]).	

	csv := String cr join: export.
	
	
	csvFile := (interview file parent / (interview file basenameWithoutExtension ,'.csv')) asFileReference.

	csvFile writeStreamDo: [ :aStream |
			 aStream << csv ].
	^csvFile
]

{ #category : 'initialization' }
InterviewLoader >> initialize [
	super initialize. 

llmApi := LLMAPI chat
		          host: 'api.mistral.ai';
		          yourself
]

{ #category : 'initialize' }
InterviewLoader >> interview: anITWInterview [

	interview := anITWInterview.
	text := interview file contents . 
]

{ #category : 'matcher' }
InterviewLoader >> matchTopicFor: anITWSetence [

	| content response result |
	(model allWithType: ITWTheme) do: [ :topic |
		| answer association |
		content := self
			           createRequestContentForSetence: anITWSetence
			           withTopic: topic.

		response := self requestLLMWithUserContent: content.

		result := NeoJSONReader fromString: response.

		self flag: 'must perform result verification '.
		answer := (result at: #match) asLowercase asSymbol.

		association := model newAssociation
			               matching: answer;
			               explaination: (result at: #explaination).
		
		
		association
			sentence: anITWSetence;
			topic: topic;
			interview: anITWSetence interview.

		answer = #no ifTrue: [
			anITWSetence nos add: topic unless: [ :a :b | a name = b name ] ].
		answer = #yes ifTrue: [
			anITWSetence yeses add: topic unless: [ :a :b | a name = b name ] ].
		answer = #unknow ifTrue: [
			anITWSetence unknowns
				add: topic
				unless: [ :a :b | a name = b name ] ] ]
]

{ #category : 'initialize' }
InterviewLoader >> mistralToken: aToken [ 
	llmApi apiKey: aToken 
]

{ #category : 'accessing' }
InterviewLoader >> model: anITWModel [ 
	model := anITWModel
]

{ #category : 'actions' }
InterviewLoader >> performMatching [
	|count total|
	count := 0. 
	total := interview sentences size asString. 
	('start matching') recordInfo .
	interview sentences do: [ :sentence | 
		((count := count + 1) asString,'/', total) recordInfo .
		self matchTopicFor: sentence ].
	('DONE matching') recordInfo .
]

{ #category : 'as yet unclassified' }
InterviewLoader >> promptForSentence: aSentence [
	|previously next|
	previously := (self
		               collectFrom: aSentence
		               SentencesOn: OrderedCollection new
		               downto: 4) sort: [ :a :b | a index < b index ].
	next := (self
		         collectFrom: aSentence
		         SentencesOn: OrderedCollection new
		         upto: 2) sort: [ :a :b | a index < b index ].

	^ String cr join: {
			  '<CONTEXTE>'.
			  (String cr join: (previously collect: #printString)).
			  '<VERBATIM>'.
			  aSentence printString.
			  '</VERBATIM>'.
			  (String cr join: (next collect: #printString)).
			  '</CONTEXTE>'.}
]

{ #category : 'prompt' }
InterviewLoader >> promptForTopic: anITWTheme [

	
	^ '' join: {'<TOPIC><NAME>'. anITWTheme name. '</NAME>' . '<DESCRIPTION>' .  anITWTheme description . '</DESCRIPTION> </TOPIC>' }
]

{ #category : 'as yet unclassified' }
InterviewLoader >> requestLLMWithUserContent: aContent [

	aContent trimmed isEmpty ifTrue: [ ^ '' ].

	llmApi payload
		temperature: 0.1;
		"model: 'mistral-large-2411';"
		"model: 'mistral-medium-2508';"
		model: 'mistral-small-latest';
		top_p: 1;
		response_format: self buildResponseFormat;
		messages: {
				(LLMAPIChatObjectMessage role: 'system' content: self systemPrompt).
				(LLMAPIChatObjectMessage role: 'user' content: aContent) }.

	^ llmApi performRequest
]

{ #category : 'accessing' }
InterviewLoader >> systemPrompt [

	^ 'Tu es un expert en analyse qualitive de donnée. Ton objectif est d''annotée à quel topic appartient un verbatim spécifique. Pour cela tu disposera - du verbatim dénoté par les balise <VERBATIM> - d''un contexte <CONTEXTE> de phrase qui entour ce verbatime. A partir d''un topic dénoté par <TOPIC>, décrit par son nom et une description, tu dois attribuer à <VERBATIM> une valeur nominal qui serait au choix "YES", "NO", "UNKNOW", selon la possibilité de matching entre le TOPIC et le VERBATIM. Il s''agira ici d''une conversation entre un développeur [DEV] et un interviewer [INTERVIEWER] qui porte sur les points de pénibilité du travail du développeur. Output le resultat dans un format JSON.

Voici le cas d''étude :
'
]

{ #category : 'prompt' }
InterviewLoader >> topicPromptFrom: themes [

	^ '' join: {
			  '<TOPIC>'.
			  ('; ' join: (themes collect: #name)).
			  '</TOPIC>' }
]
