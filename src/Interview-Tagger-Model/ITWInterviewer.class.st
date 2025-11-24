"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `conducts` | `ITWInterviewer` | `by` | `ITWInterview` | |



"
Class {
	#name : 'ITWInterviewer',
	#superclass : 'ITWActor',
	#instVars : [
		'#conducts => FMMany type: #ITWInterview opposite: #by'
	],
	#category : 'Interview-Tagger-Model-Entities',
	#package : 'Interview-Tagger-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
ITWInterviewer class >> annotation [

	<FMClass: #Interviewer super: #ITWActor>
	<package: #'Interview-Tagger-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
ITWInterviewer >> addConduct: anObject [
	<generated>
	^ self conducts add: anObject
]

{ #category : 'accessing' }
ITWInterviewer >> conducts [
	"Relation named: #conducts type: #ITWInterview opposite: #by"

	<generated>
	<derived>
	^ conducts
]

{ #category : 'accessing' }
ITWInterviewer >> conducts: anObject [

	<generated>
	conducts value: anObject
]

{ #category : 'navigation' }
ITWInterviewer >> conductsGroup [
	<generated>
	<navigation: 'Conducts'>
	^ MooseSpecializedGroup withAll: self conducts asSet
]
