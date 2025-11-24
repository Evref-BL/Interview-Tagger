"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `participes` | `ITWDevelopper` | `with` | `ITWInterview` | |



"
Class {
	#name : 'ITWDevelopper',
	#superclass : 'ITWActor',
	#instVars : [
		'#participes => FMMany type: #ITWInterview opposite: #with'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWDevelopper class >> annotation [

	<FMClass: #Developper super: #ITWActor>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
ITWDevelopper >> addParticipe: anObject [
	<generated>
	^ self participes add: anObject
]

{ #category : 'accessing' }
ITWDevelopper >> participes [
	"Relation named: #participes type: #ITWInterview opposite: #with"

	<generated>
	<derived>
	^ participes
]

{ #category : 'accessing' }
ITWDevelopper >> participes: anObject [

	<generated>
	participes value: anObject
]

{ #category : 'navigation' }
ITWDevelopper >> participesGroup [
	<generated>
	<navigation: 'Participes'>
	^ MooseSpecializedGroup withAll: self participes asSet
]
