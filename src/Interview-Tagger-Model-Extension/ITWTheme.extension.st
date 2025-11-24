Extension { #name : 'ITWTheme' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWTheme >> mooseNameOn: aStream [
	
	aStream << self name ifNil: [ '<no name>' ].
]
