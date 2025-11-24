Class {
	#name : 'ITWEntity',
	#superclass : 'MooseEntity',
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
ITWEntity class >> isAbstract [

	<generated>
	^ self == ITWEntity
]

{ #category : 'meta' }
ITWEntity class >> metamodel [

	<generated>
	^ ITWModel metamodel
]
