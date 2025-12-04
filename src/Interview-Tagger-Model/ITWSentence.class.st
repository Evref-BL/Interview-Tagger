"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `actor` | `ITWSentence` | `sentences` | `ITWActor` | |
| `interview` | `ITWSentence` | `sentences` | `ITWInterview` | |
| `next` | `ITWSentence` | `previous` | `ITWSentence` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `previous` | `ITWSentence` | `next` | `ITWSentence` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `nos` | `ITWSentence` | `nos` | `ITWTheme` | |
| `unknowns` | `ITWSentence` | `unknowns` | `ITWTheme` | |
| `yeses` | `ITWSentence` | `yeses` | `ITWTheme` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | |
| `index` | `Number` | nil | |

"
Class {
	#name : 'ITWSentence',
	#superclass : 'ITWEntity',
	#instVars : [
		'#content => FMProperty',
		'#index => FMProperty',
		'#actor => FMOne type: #ITWActor opposite: #sentences',
		'#interview => FMOne type: #ITWInterview opposite: #sentences',
		'#yeses => FMMany type: #ITWTheme opposite: #yeses',
		'#nos => FMMany type: #ITWTheme opposite: #nos',
		'#unknowns => FMMany type: #ITWTheme opposite: #unknowns',
		'#previous => FMOne type: #ITWSentence opposite: #next',
		'#next => FMOne type: #ITWSentence opposite: #previous'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWSentence class >> annotation [

	<FMClass: #Sentence super: #ITWEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
ITWSentence >> actor [
	"Relation named: #actor type: #ITWActor opposite: #sentences"

	<generated>
	<container>
	^ actor
]

{ #category : 'accessing' }
ITWSentence >> actor: anObject [

	<generated>
	actor := anObject
]

{ #category : 'navigation' }
ITWSentence >> actorGroup [
	<generated>
	<navigation: 'Actor'>
	^ MooseSpecializedGroup with: self actor
]

{ #category : 'adding' }
ITWSentence >> addNo: anObject [
	<generated>
	^ self nos add: anObject
]

{ #category : 'adding' }
ITWSentence >> addUnknown: anObject [
	<generated>
	^ self unknowns add: anObject
]

{ #category : 'adding' }
ITWSentence >> addYese: anObject [
	<generated>
	^ self yeses add: anObject
]

{ #category : 'as yet unclassified' }
ITWSentence >> collectDicThemesRelations [

	| dic |
	dic := OrderedDictionary new.
	self mooseModel collectThemeNames do: [ :name |
		dic at: name asSymbol put: #unknown ].

	self yeses do: [ :theme | dic at: theme name asSymbol put: #yes ].
	self nos do: [ :theme | dic at: theme name asSymbol put: #no ].
	self unknowns do: [ :theme |
		dic at: theme name asSymbol put: #unknown ].

	^ dic
]

{ #category : 'accessing' }
ITWSentence >> content [

	<FMProperty: #content type: #String>
	<generated>
	^ content
]

{ #category : 'accessing' }
ITWSentence >> content: anObject [
	<generated>
	content := anObject
]

{ #category : 'accessing' }
ITWSentence >> index [

	<FMProperty: #index type: #Number>
	<generated>
	^ index
]

{ #category : 'accessing' }
ITWSentence >> index: anObject [
	<generated>
	index := anObject
]

{ #category : 'accessing' }
ITWSentence >> interview [
	"Relation named: #interview type: #ITWInterview opposite: #sentences"

	<generated>
	<container>
	^ interview
]

{ #category : 'accessing' }
ITWSentence >> interview: anObject [

	<generated>
	interview := anObject
]

{ #category : 'navigation' }
ITWSentence >> interviewGroup [
	<generated>
	<navigation: 'Interview'>
	^ MooseSpecializedGroup with: self interview
]

{ #category : 'accessing' }
ITWSentence >> next [
	"Relation named: #next type: #ITWSentence opposite: #previous"

	<generated>
	<container>
	<derived>
	^ next
]

{ #category : 'accessing' }
ITWSentence >> next: anObject [

	<generated>
	next := anObject
]

{ #category : 'navigation' }
ITWSentence >> nextGroup [
	<generated>
	<navigation: 'Next'>
	^ MooseSpecializedGroup with: self next
]

{ #category : 'accessing' }
ITWSentence >> nos [
	"Relation named: #nos type: #ITWTheme opposite: #nos"

	<generated>
	<derived>
	^ nos
]

{ #category : 'accessing' }
ITWSentence >> nos: anObject [

	<generated>
	nos value: anObject
]

{ #category : 'accessing' }
ITWSentence >> previous [
	"Relation named: #previous type: #ITWSentence opposite: #next"

	<generated>
	^ previous
]

{ #category : 'accessing' }
ITWSentence >> previous: anObject [

	<generated>
	previous := anObject
]

{ #category : 'navigation' }
ITWSentence >> previousGroup [
	<generated>
	<navigation: 'Previous'>
	^ MooseSpecializedGroup with: self previous
]

{ #category : 'accessing' }
ITWSentence >> unknowns [
	"Relation named: #unknowns type: #ITWTheme opposite: #unknowns"

	<generated>
	<derived>
	^ unknowns
]

{ #category : 'accessing' }
ITWSentence >> unknowns: anObject [

	<generated>
	unknowns value: anObject
]

{ #category : 'accessing' }
ITWSentence >> yeses [
	"Relation named: #yeses type: #ITWTheme opposite: #yeses"

	<generated>
	<derived>
	^ yeses
]

{ #category : 'accessing' }
ITWSentence >> yeses: anObject [

	<generated>
	yeses value: anObject
]
