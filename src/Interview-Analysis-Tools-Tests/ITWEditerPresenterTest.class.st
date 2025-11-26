Class {
	#name : 'ITWEditerPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
ITWEditerPresenterTest >> testPresenter [

	|presenter|
	presenter := ITWInterviewPresenter on: ITWModelMock new interview1.
	
	presenter open
]
