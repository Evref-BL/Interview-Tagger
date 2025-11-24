"
An InterviewImporterTest is a test class for testing the behavior of InterviewImporter
"
Class {
	#name : 'InterviewImporterTest',
	#superclass : 'TestCase',
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
InterviewImporterTest >> testFile [

	self assert: InterviewImporter new file equals: nil
]

{ #category : 'tests' }
InterviewImporterTest >> testFileWithPath [

	self assert: (InterviewImporter new file: 'a/path') file class equals: FileReference 
]
