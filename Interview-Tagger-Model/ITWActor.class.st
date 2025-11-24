"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sentences` | `ITWActor` | `actor` | `ITWSentence` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | |

"
Class {
	#name : 'ITWActor',
	#superclass : 'ITWEntity',
	#instVars : [
		'#name => FMProperty',
		'#sentences => FMMany type: #ITWSentence opposite: #actor'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWActor class >> annotation [

	<FMClass: #Actor super: #ITWEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
ITWActor >> addSentence: anObject [
	<generated>
	^ self sentences add: anObject
]

{ #category : 'accessing' }
ITWActor >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
ITWActor >> name: anObject [
	<generated>
	name := anObject
]

{ #category : 'accessing' }
ITWActor >> sentences [
	"Relation named: #sentences type: #ITWSentence opposite: #actor"

	<generated>
	<derived>
	^ sentences
]

{ #category : 'accessing' }
ITWActor >> sentences: anObject [

	<generated>
	sentences value: anObject
]

{ #category : 'navigation' }
ITWActor >> sentencesGroup [
	<generated>
	<navigation: 'Sentences'>
	^ MooseSpecializedGroup withAll: self sentences asSet
]
