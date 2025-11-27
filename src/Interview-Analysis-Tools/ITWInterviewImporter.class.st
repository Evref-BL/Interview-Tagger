Class {
	#name : 'ITWInterviewImporter',
	#superclass : 'ITWImporter',
	#instVars : [
		'file'
	],
	#category : 'Interview-Analysis-Tools',
	#package : 'Interview-Analysis-Tools'
}

{ #category : 'accessing' }
ITWInterviewImporter >> file [
	^ file
]

{ #category : 'accessing' }
ITWInterviewImporter >> file: aFileReferenceOrString [
	file := aFileReferenceOrString asFileReference 
]

{ #category : 'importing' }
ITWInterviewImporter >> import [

	| lines itw |
	itw := model newInterview.
	itw title: self file basenameWithoutExtension.
	itw file: self file.
	lines := self file contents lines.
	self importSentencesOfLines: lines forInterview: itw.
	
	^ itw
]
