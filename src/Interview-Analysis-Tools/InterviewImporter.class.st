Class {
	#name : 'InterviewImporter',
	#superclass : 'Object',
	#instVars : [
		'file',
		'model'
	],
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'as yet unclassified' }
InterviewImporter >> detectThemes: aCollection [ 
	self shouldBeImplemented.
]

{ #category : 'accessing' }
InterviewImporter >> file [
	^ file
]

{ #category : 'accessing' }
InterviewImporter >> file: aFileReferenceOrString [
	file := aFileReferenceOrString asFileReference 
]

{ #category : 'importing' }
InterviewImporter >> import [

	| lines index itw previousLine|
	itw := model newInterview.
	itw title: self file basenameWithoutExtension.
	itw file: self file.
	
	lines := self file contents lines.
	index := 0.
	previousLine := nil.
	lines do: [ :line |
		| actorTag sentence actor |
		actorTag := line copyFrom: 1 to: (line indexOf: $]).

		actorTag = '[INTERVIEWER]' ifTrue: [
			actor := ITWInterviewer new name: actorTag allButLast allButFirst ].
		actorTag = '[DEV]' ifTrue: [
			actor := ITWDevelopper new name: actorTag allButLast allButFirst ].

		actor := model add: actor unless: [ :x :y | x name = y name ].

		sentence := model newSentence.
		sentence
			content: (line copyFrom: (line indexOf: $]) + 1 to: line size);
			actor: actor;
			index: (index := index + 1).
			
		previousLine ifNotNil: [ :l | sentence previous: l ].	
			
		itw addSentence: sentence.
		previousLine := sentence 
		 ].
	^ itw
]

{ #category : 'initialization' }
InterviewImporter >> initialize [

	super initialize.
	model := ITWModel new. 
]

{ #category : 'accessing' }
InterviewImporter >> model: anInterviewModel [
	model := anInterviewModel. 
]
