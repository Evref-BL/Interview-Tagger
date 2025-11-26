Extension { #name : 'ITWSentence' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> mooseNameOn: aStream [

	aStream << (self printString truncatedToSize: 50)
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> printString [

	^ '[' , (self actor name ifNil: [ '' ]) , ']', self content
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> removeAllThemes: aCollection [ 
	
	self yeses removeAllFoundIn: aCollection.
	self nos removeAllFoundIn: aCollection.
	self unknowns removeAllFoundIn: aCollection.
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> resetThemes [
	self shouldBeImplemented.
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> setToNoTheme: aCollection [ 
	self removeAllThemes: aCollection . 
	self nos addAll: aCollection. 

]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> setToUnknownTheme: aCollection [ 
	
	self removeAllThemes: aCollection.
	self unknowns addAll:aCollection.
]

{ #category : '*Interview-Tagger-Model-Extension' }
ITWSentence >> setToYesTheme: aCollection [ 

	self removeAllThemes: aCollection . 
	self yeses addAll: aCollection. 

]
