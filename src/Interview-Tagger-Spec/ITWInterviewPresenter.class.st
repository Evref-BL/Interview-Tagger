Class {
	#name : 'ITWInterviewPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'table'
	],
	#category : 'Interview-Tagger-Spec',
	#package : 'Interview-Tagger-Spec'
}

{ #category : 'layout' }
ITWInterviewPresenter >> defaultLayout [
	"one child named table, layout top to bottom"
	^ SpBoxLayout newTopToBottom
		  add: #table;
		  yourself
]

{ #category : 'initialization' }
ITWInterviewPresenter >> initializePresenters [

	table := self newTable.

	self model.
	table addColumn: (SpStringTableColumn new
			 title: 'Actor';
			 evaluated: [ :line | line actor name ];
			 width: 100).
	table addColumn: (SpStringTableColumn
			 title: 'Sentence'
			 evaluated: [ :line | line content ]).

	table addColumn: (SpStringTableColumn new
			 title: 'Yes';
			 evaluated: [ :line | '; ' join: (line yeses collect: #name) ]).
	table addColumn: (SpStringTableColumn new
			 title: 'No';
			 evaluated: [ :line | '; ' join: (line nos collect: #name) ]).
	table addColumn: (SpStringTableColumn new
			 title: 'Unknow';
			 evaluated: [ :line | '; ' join: (line unknowns collect: #name) ]).

	table items: self model sentences.
	table beResizable.
	

]

{ #category : 'refresh' }
ITWInterviewPresenter >> refreshTableItems [
	table items: self model sentences.
]

{ #category : 'enumerating' }
ITWInterviewPresenter >> whenActivatedDo: aBlock [

	table whenActivatedDo: aBlock 
]
