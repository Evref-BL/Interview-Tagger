Class {
	#name : 'ITWEditerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table'
	],
	#category : 'Interview-Tagger-Spec',
	#package : 'Interview-Tagger-Spec'
}

{ #category : 'layout' }
ITWEditerPresenter >> defaultLayout [
	"one child named table, layout top to bottom"
	^ SpBoxLayout newTopToBottom
		  add: #table;
		  yourself
]

{ #category : 'initialization' }
ITWEditerPresenter >> initializePresenters [
	table := self newTable 
	
]
