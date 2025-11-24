"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'ITWTEntityCreator',
	#category : 'Interview-Tagger-Model-Model',
	#package : 'Interview-Tagger-Model',
	#tag : 'Model'
}

{ #category : 'meta' }
ITWTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newActor [

	<generated>
	^ self add: ITWActor new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newAssociation [

	<generated>
	^ self add: ITWAssociation new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newDevelopper [

	<generated>
	^ self add: ITWDevelopper new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newInterview [

	<generated>
	^ self add: ITWInterview new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newInterviewer [

	<generated>
	^ self add: ITWInterviewer new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newSentence [

	<generated>
	^ self add: ITWSentence new
]

{ #category : 'entity creation' }
ITWTEntityCreator >> newTheme [

	<generated>
	^ self add: ITWTheme new
]
