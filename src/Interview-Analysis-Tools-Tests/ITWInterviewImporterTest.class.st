"
An InterviewImporterTest is a test class for testing the behavior of InterviewImporter
"
Class {
	#name : 'ITWInterviewImporterTest',
	#superclass : 'TestCase',
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
ITWInterviewImporterTest >> testFile [

	self assert: ITWInterviewImporter new file equals: nil
]

{ #category : 'tests' }
ITWInterviewImporterTest >> testFileWithPath [

	self assert: (ITWInterviewImporter new file: 'a/path') file class equals: FileReference 
]
