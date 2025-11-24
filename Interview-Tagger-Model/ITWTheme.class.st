"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `nos` | `ITWTheme` | `nos` | `ITWSentence` | |
| `unknowns` | `ITWTheme` | `unknowns` | `ITWSentence` | |
| `yeses` | `ITWTheme` | `yeses` | `ITWSentence` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `description` | `String` | nil | |
| `name` | `String` | nil | |
| `value` | `String` | nil | |

"
Class {
	#name : 'ITWTheme',
	#superclass : 'ITWEntity',
	#instVars : [
		'#name => FMProperty',
		'#value => FMProperty',
		'#description => FMProperty',
		'#yeses => FMMany type: #ITWSentence opposite: #yeses',
		'#nos => FMMany type: #ITWSentence opposite: #nos',
		'#unknowns => FMMany type: #ITWSentence opposite: #unknowns'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWTheme class >> annotation [

	<FMClass: #Theme super: #ITWEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
ITWTheme >> addNo: anObject [
	<generated>
	^ self nos add: anObject
]

{ #category : 'adding' }
ITWTheme >> addUnknown: anObject [
	<generated>
	^ self unknowns add: anObject
]

{ #category : 'adding' }
ITWTheme >> addYese: anObject [
	<generated>
	^ self yeses add: anObject
]

{ #category : 'accessing' }
ITWTheme >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : 'accessing' }
ITWTheme >> description: anObject [
	<generated>
	description := anObject
]

{ #category : 'accessing' }
ITWTheme >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
ITWTheme >> name: anObject [
	<generated>
	name := anObject
]

{ #category : 'accessing' }
ITWTheme >> nos [
	"Relation named: #nos type: #ITWSentence opposite: #nos"

	<generated>
	^ nos
]

{ #category : 'accessing' }
ITWTheme >> nos: anObject [

	<generated>
	nos value: anObject
]

{ #category : 'accessing' }
ITWTheme >> unknowns [
	"Relation named: #unknowns type: #ITWSentence opposite: #unknowns"

	<generated>
	^ unknowns
]

{ #category : 'accessing' }
ITWTheme >> unknowns: anObject [

	<generated>
	unknowns value: anObject
]

{ #category : 'accessing' }
ITWTheme >> value [

	<FMProperty: #value type: #String>
	<generated>
	^ value
]

{ #category : 'accessing' }
ITWTheme >> value: anObject [
	<generated>
	value := anObject
]

{ #category : 'accessing' }
ITWTheme >> yeses [
	"Relation named: #yeses type: #ITWSentence opposite: #yeses"

	<generated>
	^ yeses
]

{ #category : 'accessing' }
ITWTheme >> yeses: anObject [

	<generated>
	yeses value: anObject
]
