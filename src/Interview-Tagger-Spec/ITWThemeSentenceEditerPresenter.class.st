Class {
	#name : 'ITWThemeSentenceEditerPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'table',
		'title',
		'sentence',
		'yesBox',
		'noBox',
		'unknownBox',
		'whenThemeChanged'
	],
	#category : 'Interview-Tagger-Spec',
	#package : 'Interview-Tagger-Spec'
}

{ #category : 'layout' }
ITWThemeSentenceEditerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		add: #title withConstraints: [:constraints | constraints height: self class labelHeight ]; 
		add: #sentence withConstraints: [:constraints | constraints height: self class labelHeight ]; 

		add: (SpBoxLayout newLeftToRight add: #yesBox; add: #noBox; add: #unknownBox; yourself); yourself
]

{ #category : 'as yet unclassified' }
ITWThemeSentenceEditerPresenter >> initializePresenters [

	title := self newLabel label:
		         'Drag and drop the themes to the correct relation'.
	
	sentence := self newLink
		            label: 'unselected sentences';
		            action: [ self model inspect ].


	yesBox := self newEasyListView
		          headerTitle: 'YES';
		          items: {  };
		          display: [ :item | item name ];
		          dragEnabled: true;
		          dropEnabled: true;
		          acceptDrop: [ :transfer |
				          self model setToYesTheme: transfer passenger.
				          self refreshBox ];
		          whenDragStartDo: [ :ann |
				          ann transfer description:
						          ('Passing "{1}" element' format:
								           ann transfer passenger) ].

	noBox := self newEasyListView
		         headerTitle: 'NO';
		         items: {  };
		         display: [ :item | item name ];
		         dragEnabled: true;
		         dropEnabled: true;
		         acceptDrop: [ :transfer |
				         self model setToNoTheme: transfer passenger.
				         self refreshBox ];
		         whenDragStartDo: [ :ann |
				         ann transfer description:
						         ('Passing "{1}" element' format: ann transfer passenger) ].

	unknownBox := self newEasyListView
		              headerTitle: 'UNKNOWN';
		              items: {  };
		              display: [ :item | item name ];
		              dragEnabled: true;
		              dropEnabled: true;
		              acceptDrop: [ :transfer |
				              self model setToUnknownTheme: transfer passenger.
				              self refreshBox ];
		              whenDragStartDo: [ :ann |
				              ann transfer description:
						              ('Passing "{1}" element' format:
								               ann transfer passenger) ]
]

{ #category : 'initialization' }
ITWThemeSentenceEditerPresenter >> modelChanged [ 

self model ifNotNil: [ 
	sentence label: self model content.
	self refreshBox .
	 ] 
	
	
]

{ #category : 'as yet unclassified' }
ITWThemeSentenceEditerPresenter >> refreshBox [
	yesBox items: self model yeses. 
	noBox items: self model nos . 
	unknownBox items: self model unknowns. 
	whenThemeChanged value. 
]

{ #category : 'when' }
ITWThemeSentenceEditerPresenter >> whenThemeChangedDo: aFullBlockClosure [ 
	
	whenThemeChanged:= aFullBlockClosure
]
