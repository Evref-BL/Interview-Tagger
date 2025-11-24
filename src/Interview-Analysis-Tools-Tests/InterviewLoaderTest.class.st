"
An InterviewLoaderTest is a test class for testing the behavior of InterviewLoader
"
Class {
	#name : 'InterviewLoaderTest',
	#superclass : 'TestCase',
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
InterviewLoaderTest >> testTopicPromptFrom [

	self assert: (InterviewLoader new topicPromptFrom: { ITWTheme new name: 'T1' .  ITWTheme new name: 'T1'  }) equals: '<TOPIC>T1, T1</TOPIC>'
]
