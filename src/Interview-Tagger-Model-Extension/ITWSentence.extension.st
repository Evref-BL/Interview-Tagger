Extension { #name : 'ITWSentence' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> mooseNameOn: aStream [

	aStream << (self printString truncatedToSize: 50)
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> printString [

	^ '[' , (self actor name ifNil: [ '' ]) , ']', self content
]
