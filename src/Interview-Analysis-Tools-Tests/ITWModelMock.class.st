Class {
	#name : 'ITWModelMock',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'initialization' }
ITWModelMock >> initialize [

	| interviewer dev s1 s2 itw salutation association1 association2 aurevoir adieu s3 |
	model := ITWModel new.
	interviewer := model newInterviewer
		               name: 'INTERVIEWER';
		               yourself.
	dev := model newDevelopper
		       name: 'DEV';
		       yourself.

	s1 := model newSentence
		      content: 'bonjour';
		      actor: interviewer;
		      index: 1;
		      yourself.

	s2 := model newSentence
		      content: 'au revoir';
		      actor: dev;
		      index: 2;
		      yourself.
		
	s3 := model newSentence
		      content: 'ok adieu alors...';
		      actor: interviewer;
		      index: 3;
		      yourself.

	itw := model newInterview
		       sentences: { s1 . s2 . s3};
		       yourself.


	salutation := model newTheme
		              name: 'salutation';
		              description: 'on se dit bonjour';
		              yourself.

	aurevoir := model newTheme
		            name: 'au revoir';
		            description: 'on se dit au revoir';
		            yourself.

	adieu := model newTheme
		         name: 'adieu';
		         description: 'on se dit adieu';
		         yourself.


	s1 addYese: salutation.
	s1 addNo: aurevoir.
	s1 addNo: adieu.

	s2 addYese: aurevoir.
	s2 addNo: salutation.
	s2 addUnknown: adieu.
	
	s3 addYese: adieu.
	s3 addNo: salutation; addNo: aurevoir.



	association1 := model newAssociation
		                sentence: s1;
		                interview: itw;
		                topic: salutation;
		                matching: #YES;
		                yourself.


	association2 := model newAssociation
		                sentence: s2;
		                interview: itw;
		                topic: salutation;
		                matching: #YES;
		                yourself
]

{ #category : 'accessing' }
ITWModelMock >> interview1 [

	^ (model allWithType: ITWInterview) first
]

{ #category : 'accessing' }
ITWModelMock >> model [ 
	^ model
]

{ #category : 'accessing' }
ITWModelMock >> sentence1 [
	^ self interview1 sentences first
]
