Class {
	#name : 'ITWModelImporter',
	#superclass : 'ITWImporter',
	#instVars : [
		'relationsData'
	],
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'instance creation' }
ITWModelImporter class >> fromCSV: aPathAsStringOrFileReference [
	^ self new fromCSV: aPathAsStringOrFileReference
]

{ #category : 'instance creation' }
ITWModelImporter >> fromCSV: aCSVFileReference [
	^ self fromCSVContents: aCSVFileReference asFileReference contents.
]

{ #category : 'import' }
ITWModelImporter >> fromCSVContents: aString [ 
	
	|itw data themeArray index sentences |
	
	data := (NeoCSVReader on: aString readStream) upToEnd.
	itw := model newInterview title: 'default'; yourself.
	
	themeArray := data first allButFirst allButFirst.
	
	themeArray := themeArray collect: [ :themeName |
		model newTheme name: themeName trim.
		 ].	
	
	index := 0.
	sentences := data allButFirst collect: [ :aLine |
		|sentence |
		sentence := self importSentenceFromLine: aLine second trim withIndex: (index := index + 1).
		].

	relationsData := data allButFirst collect: [ :line | line allButFirst allButFirst ].
	
	relationsData doWithIndex: [ :elmts :i  | 
		|anITWSetence|
		anITWSetence := sentences at: i.
		elmts doWithIndex: [ :elmt :t | 
			| topic answer|
			
			answer := elmt trim asLowercase asSymbol. 
			topic := (model allWithType: ITWTheme) detect: [:theme | theme name = (themeArray at: t) name].
			
			answer = #no ifTrue: [
			anITWSetence nos add: topic  ].
		answer = #yes ifTrue: [
			anITWSetence yeses add: topic  ].
		answer = #unknow ifTrue: [
			anITWSetence unknowns
				add: topic ]
			 ]
		 ].
		
	itw sentences addAll: sentences. 

^ model.
]
