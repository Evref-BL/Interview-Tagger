Class {
	#name : 'InterviewModelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'interview',
		'sentence',
		'actor',
		'theme',
		'dev',
		'interviewer',
		'association'
	],
	#category : 'Interview-Tagger-Generator',
	#package : 'Interview-Tagger-Generator'
}

{ #category : 'accessing' }
InterviewModelGenerator class >> packageName [ 
	^ 'Interview-Tagger-Model'
]

{ #category : 'accessing' }
InterviewModelGenerator class >> prefix [

	^ 'ITW'
]

{ #category : 'definition' }
InterviewModelGenerator >> defineClasses [

	super defineClasses.

	interview := builder ensureClassNamed: #Interview.
	sentence := builder ensureClassNamed: #Sentence.
	actor := builder ensureClassNamed: #Actor.
	dev := builder ensureClassNamed: #Developper.
	interviewer := builder ensureClassNamed: #Interviewer.
	theme := builder ensureClassNamed: #Theme.
	association := builder ensureClassNamed: #Association 
]

{ #category : 'definition' }
InterviewModelGenerator >> defineHierarchy [

	super defineHierarchy.
	
	actor <|-- dev.
	actor <|-- interviewer.
	
	
]

{ #category : 'definition' }
InterviewModelGenerator >> defineProperties [

	super defineProperties.
	interview property: #title type: #String.
	interview property: #date type: #Object.
	interview property: #location type: #String.
	interview property: #file type: #Object.

	actor property: #name type: #String.

	sentence property: #content type: #String.
	sentence property: #index type: #Number.

	theme property: #name type: #String.
	theme property: #value type: #String.
	theme property: #description type: #String.

	association property: #explaination type: #String.
	association property: #matching type: #String.
	association property: #sentence type: #Object.
	association property: #topic type: #Object
]

{ #category : 'definition' }
InterviewModelGenerator >> defineRelations [

	super defineRelations.

	(interviewer property: #conducts) <>-* (interview property: #by).
	(dev property: #participes) <>-* (interview property: #with).

	actor <>-* sentence.
	interview <>-* sentence.

	(sentence property: #yeses) *-* (theme property: #yeses).
	(sentence property: #nos) *-* (theme property: #nos).
	(sentence property: #unknowns) *-* (theme property: #unknowns).

	(sentence property: #previous) <>- (sentence property: #next).
	
	interview -* association.
]
