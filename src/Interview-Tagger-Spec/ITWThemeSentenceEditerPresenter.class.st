Class {
	#name : 'ITWThemeSentenceEditerPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'table',
		'title',
		'sentence',
		'yesBox',
		'noBox',
		'unknowBox'
	],
	#category : 'Interview-Tagger-Spec',
	#package : 'Interview-Tagger-Spec'
}

{ #category : 'as yet unclassified' }
ITWThemeSentenceEditerPresenter >> initializePresenters [


	
	title :=  self newLabel label: 'Drag and drop the themes to the correct relation'. 
	sentence := self newLabel label: self model content.
	
	yesBox := ''.
	noBox := ''.
	unknowBox := ''.


]
