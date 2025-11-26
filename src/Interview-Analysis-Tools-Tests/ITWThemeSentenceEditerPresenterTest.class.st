Class {
	#name : 'ITWThemeSentenceEditerPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
ITWThemeSentenceEditerPresenterTest >> testPresenter [
	(ITWThemeSentenceEditerPresenter on:( ITWModelMock new sentence1)) open
]
