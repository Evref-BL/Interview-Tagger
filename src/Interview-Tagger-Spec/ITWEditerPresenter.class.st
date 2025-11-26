Class {
	#name : 'ITWEditerPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'interviewPresenter',
		'themeSentencePresenter'
	],
	#category : 'Interview-Tagger-Spec',
	#package : 'Interview-Tagger-Spec'
}

{ #category : 'as yet unclassified' }
ITWEditerPresenter class >> openExample [
	<script>
	|presenter|
	presenter := self on: ITWModelMock new interview1.
	
	presenter open
]

{ #category : 'layout' }
ITWEditerPresenter >> defaultLayout [ 
	^ SpBoxLayout newTopToBottom 
		add: #interviewPresenter;
		add: #themeSentencePresenter; yourself
]

{ #category : 'initialization' }
ITWEditerPresenter >> initializePresenters [ 
	
	interviewPresenter := ITWInterviewPresenter on: self model.

	themeSentencePresenter := ITWThemeSentenceEditerPresenter new. 
	themeSentencePresenter whenThemeChangedDo: [ interviewPresenter refreshTableItems ].
	
	
	interviewPresenter whenActivatedDo: [ :selection | themeSentencePresenter model: selection selectedItem ].
	
	
]
