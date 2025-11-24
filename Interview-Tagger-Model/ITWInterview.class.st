"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `by` | `ITWInterview` | `conducts` | `ITWInterviewer` | |
| `with` | `ITWInterview` | `participes` | `ITWDevelopper` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sentences` | `ITWInterview` | `interview` | `ITWSentence` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `associations` | `ITWInterview` | `interview` | `ITWAssociation` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `date` | `Object` | nil | |
| `file` | `Object` | nil | |
| `location` | `String` | nil | |
| `title` | `String` | nil | |

"
Class {
	#name : 'ITWInterview',
	#superclass : 'ITWEntity',
	#instVars : [
		'#title => FMProperty',
		'#date => FMProperty',
		'#location => FMProperty',
		'#file => FMProperty',
		'#by => FMOne type: #ITWInterviewer opposite: #conducts',
		'#with => FMOne type: #ITWDevelopper opposite: #participes',
		'#sentences => FMMany type: #ITWSentence opposite: #interview',
		'#associations => FMMany type: #ITWAssociation opposite: #interview'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWInterview class >> annotation [

	<FMClass: #Interview super: #ITWEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
ITWInterview >> addAssociation: anObject [
	<generated>
	^ self associations add: anObject
]

{ #category : 'adding' }
ITWInterview >> addSentence: anObject [
	<generated>
	^ self sentences add: anObject
]

{ #category : 'accessing' }
ITWInterview >> associations [
	"Relation named: #associations type: #ITWAssociation opposite: #interview"

	<generated>
	<derived>
	^ associations
]

{ #category : 'accessing' }
ITWInterview >> associations: anObject [

	<generated>
	associations value: anObject
]

{ #category : 'accessing' }
ITWInterview >> by [
	"Relation named: #by type: #ITWInterviewer opposite: #conducts"

	<generated>
	<container>
	^ by
]

{ #category : 'accessing' }
ITWInterview >> by: anObject [

	<generated>
	by := anObject
]

{ #category : 'navigation' }
ITWInterview >> byGroup [
	<generated>
	<navigation: 'By'>
	^ MooseSpecializedGroup with: self by
]

{ #category : 'accessing' }
ITWInterview >> date [

	<FMProperty: #date type: #Object>
	<generated>
	^ date
]

{ #category : 'accessing' }
ITWInterview >> date: anObject [
	<generated>
	date := anObject
]

{ #category : 'accessing' }
ITWInterview >> file [

	<FMProperty: #file type: #Object>
	<generated>
	^ file
]

{ #category : 'accessing' }
ITWInterview >> file: anObject [
	<generated>
	file := anObject
]

{ #category : 'accessing' }
ITWInterview >> location [

	<FMProperty: #location type: #String>
	<generated>
	^ location
]

{ #category : 'accessing' }
ITWInterview >> location: anObject [
	<generated>
	location := anObject
]

{ #category : 'accessing' }
ITWInterview >> sentences [
	"Relation named: #sentences type: #ITWSentence opposite: #interview"

	<generated>
	<derived>
	^ sentences
]

{ #category : 'accessing' }
ITWInterview >> sentences: anObject [

	<generated>
	sentences value: anObject
]

{ #category : 'navigation' }
ITWInterview >> sentencesGroup [
	<generated>
	<navigation: 'Sentences'>
	^ MooseSpecializedGroup withAll: self sentences asSet
]

{ #category : 'accessing' }
ITWInterview >> title [

	<FMProperty: #title type: #String>
	<generated>
	^ title
]

{ #category : 'accessing' }
ITWInterview >> title: anObject [
	<generated>
	title := anObject
]

{ #category : 'accessing' }
ITWInterview >> with [
	"Relation named: #with type: #ITWDevelopper opposite: #participes"

	<generated>
	<container>
	^ with
]

{ #category : 'accessing' }
ITWInterview >> with: anObject [

	<generated>
	with := anObject
]

{ #category : 'navigation' }
ITWInterview >> withGroup [
	<generated>
	<navigation: 'With'>
	^ MooseSpecializedGroup with: self with
]
