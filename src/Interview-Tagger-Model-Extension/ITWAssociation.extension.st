Extension { #name : 'ITWAssociation' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWAssociation >> mooseNameOn: aStream [

	self sentence ifNotNil: [ self sentence mooseNameOn: aStream ].

	self topic ifNotNil: [
		aStream << ' to: '.
		self topic mooseNameOn: aStream ].

	self matching ifNotNil: [
		aStream
			<< ' with: ';
			<< self  matching ]
]
