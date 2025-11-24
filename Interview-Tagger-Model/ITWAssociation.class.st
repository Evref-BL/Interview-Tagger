"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interview` | `ITWAssociation` | `associations` | `ITWInterview` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `explaination` | `String` | nil | |
| `matching` | `String` | nil | |
| `sentence` | `Object` | nil | |
| `topic` | `Object` | nil | |

"
Class {
	#name : 'ITWAssociation',
	#superclass : 'ITWEntity',
	#instVars : [
		'#explaination => FMProperty',
		'#matching => FMProperty',
		'#sentence => FMProperty',
		'#topic => FMProperty',
		'#interview => FMOne type: #ITWInterview opposite: #associations'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWAssociation class >> annotation [

	<FMClass: #Association super: #ITWEntity>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
ITWAssociation >> explaination [

	<FMProperty: #explaination type: #String>
	<generated>
	^ explaination
]

{ #category : 'accessing' }
ITWAssociation >> explaination: anObject [
	<generated>
	explaination := anObject
]

{ #category : 'accessing' }
ITWAssociation >> interview [
	"Relation named: #interview type: #ITWInterview opposite: #associations"

	<generated>
	^ interview
]

{ #category : 'accessing' }
ITWAssociation >> interview: anObject [

	<generated>
	interview := anObject
]

{ #category : 'accessing' }
ITWAssociation >> matching [

	<FMProperty: #matching type: #String>
	<generated>
	^ matching
]

{ #category : 'accessing' }
ITWAssociation >> matching: anObject [
	<generated>
	matching := anObject
]

{ #category : 'accessing' }
ITWAssociation >> sentence [

	<FMProperty: #sentence type: #Object>
	<generated>
	^ sentence
]

{ #category : 'accessing' }
ITWAssociation >> sentence: anObject [
	<generated>
	sentence := anObject
]

{ #category : 'accessing' }
ITWAssociation >> topic [

	<FMProperty: #topic type: #Object>
	<generated>
	^ topic
]

{ #category : 'accessing' }
ITWAssociation >> topic: anObject [
	<generated>
	topic := anObject
]
