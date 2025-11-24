Extension { #name : 'ITWInterview' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWInterview >> mooseNameOn: aStream [

	aStream << self title ifNil: [ 'no title' ].

]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWInterview >> sortedSentences [

	self sentences isEmptyOrNil ifTrue: [ ^ {  } ].

	^ self sentences sort: [ :a :b | a index < b index ]
]
