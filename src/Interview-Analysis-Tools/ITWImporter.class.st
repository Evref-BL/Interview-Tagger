Class {
	#name : 'ITWImporter',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'as yet unclassified' }
ITWImporter >> importSentenceFromLine: line [

	| index actorTag sentence actor |
	actorTag := line copyFrom: 1 to: (line indexOf: $]).
	actorTag = '[INTERVIEWER]' ifTrue: [
		actor := ITWInterviewer new name: actorTag allButLast allButFirst ].
	actorTag = '[DEV]' ifTrue: [
		actor := ITWDevelopper new name: actorTag allButLast allButFirst ].
	actor := model add: actor unless: [ :x :y | x name = y name ].
	sentence := model newSentence.
	^ sentence
		  content: (line copyFrom: (line indexOf: $]) + 1 to: line size);
		  actor: actor;
		  index: (index := index + 1)
]

{ #category : 'as yet unclassified' }
ITWImporter >> importSentenceFromLine: line withIndex: index [ 

	|  actorTag sentence actor |
	actorTag := line copyFrom: 1 to: (line indexOf: $]).
	actorTag = '[INTERVIEWER]' ifTrue: [
		actor := ITWInterviewer new name: actorTag allButLast allButFirst ].
	actorTag = '[DEV]' ifTrue: [
		actor := ITWDevelopper new name: actorTag allButLast allButFirst ].
	actor := model add: actor unless: [ :x :y | x name = y name ].
	sentence := model newSentence.
	^ sentence
		  content: (line copyFrom: (line indexOf: $]) + 1 to: line size);
		  actor: actor;
		  index: ( index )
]

{ #category : 'as yet unclassified' }
ITWImporter >> importSentencesOfLines: lines forInterview: itw [

	| index previousLine |
	index := 0.
	previousLine := nil.
	lines do: [ :line |
			| sentence |
			sentence := self importSentenceFromLine: line withIndex: (index := index +1).
			previousLine ifNotNil: [ :l | sentence previous: l ].
			itw addSentence: sentence.
			previousLine := sentence ].

	^ itw sentences
]

{ #category : 'initialization' }
ITWImporter >> initialize [ 
	super initialize.
	
	model := ITWModel new. 
]

{ #category : 'accessing' }
ITWImporter >> model [
	^ model 
]

{ #category : 'accessing' }
ITWImporter >> model: aITWModel [
	model := aITWModel 
]
