Class {
	#name : 'InterviewTaggerTest',
	#superclass : 'TestCase',
	#category : 'Interview-Tagger-Model-Extension',
	#package : 'Interview-Tagger-Model-Extension'
}

{ #category : 'tests' }
InterviewTaggerTest >> testSentencesWithActor [

	self
		assert: (ITWSetence new actor: ITWDevelopper new) actor class
		equals: ITWDevelopper
]

{ #category : 'tests' }
InterviewTaggerTest >> testSentencesWithDevPrintOn [

	self assert: ((ITWSetence new
			  actor: (ITWDevelopper new name: 'Dev');
			  content: 'Bonjour je suis un developpeur') printString
			 beginsWith: '(Dev) Bonjour')
]

{ #category : 'tests' }
InterviewTaggerTest >> testThemeInitializing [

	self
		assert: (ITWTheme new) name
		equals: nil
]

{ #category : 'tests' }
InterviewTaggerTest >> testThemeInitializing2 [

	self
		assert: (ITWTheme new) value
		equals: ''
]
