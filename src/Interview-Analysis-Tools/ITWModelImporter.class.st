Class {
	#name : 'ITWModelImporter',
	#superclass : 'ITWImporter',
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'instance creation' }
ITWModelImporter >> fromCSV: aCSVFileReference [
	^ self fromCSVContents: aCSVFileReference asFileReference contents.
]

{ #category : 'import' }
ITWModelImporter >> fromCSVContents: aString [ 
	
	|itw data themeArray index|
	
	data := (NeoCSVReader on: aString readStream) upToEnd.
	itw := model newInterview title: 'default'; yourself.
	
	themeArray := data first allButFirst allButFirst.
	
	themeArray do: [ :themeName |
		model newTheme name: themeName.
		 ].	
	
	index := 0.
	data allButFirst do: [ :aLine |
		|sentence |
		sentence := self importSentenceFromLine: aLine second trim withIndex: (index := index + 1).
		].

^ model.
]
