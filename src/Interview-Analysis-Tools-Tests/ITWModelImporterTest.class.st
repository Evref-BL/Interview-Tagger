Class {
	#name : 'ITWModelImporterTest',
	#superclass : 'TestCase',
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
ITWModelImporterTest >> testFrom2CSVContentsInSameModel [

	| model content1 content2 importer|
	content1 := 'index,sentence,Documentation,Maintenance logiciel,Compréhension du code,Tickets Jira,Revue du code,Testabilité,Environnement de développement,Interopérabilité,Communication inter-équipes,Outils CI/CD
1,"[INTERVIEWER] Ok, c''est lancé.",NO,NO,NO,NO,UNKNOW,NO,NO,NO,NO,NO
2,"[INTERVIEWER] Du coup, j''ai pas mal parlé là, mais étant l''idée c''est que toi tu parles le plus, ça te va.",NO,NO,unknown,NO,NO,NO,NO,NO,unknown,NO
3,"[INTERVIEWER] Je commence en général par demander aux gens de se présenter un petit peu, c''est-à-dire depuis qu''on est dans la boîte, tu m''as déjà dit, toi du coup tu es arrivé en...",NO,NO,NO,NO,NO,NO,NO,NO,YES,NO
4,[DEV] Moi je suis arrivé en mars 2018.,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO
'.

	content2 := 'index,sentence,Documentation,Maintenance logiciel,Compréhension du code,Tickets Jira,Revue du code,Testabilité,Environnement de développement,Interopérabilité,Communication inter-équipes,Outils CI/CD,Organisation de l''équipe
1,"[INTERVIEWER] Donc, alors, ce qu''on peut commencer par faire, c''est est-ce que tu peux me, du coup, décrire ta position au sein de l''équipe, ce que tu fais, quel est ton travail quotidien, qu''est-ce que tu utilises comme outil, ce genre de choses, si tu veux résumer en 5, 5 minutes, 10 minutes.",NO,NO,NO,NO,NO,NO,YES,NO,NO,NO,YES
2,"[DEV] C''est un peu compliqué, mais...",NO,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO
3,[DEV] Donc moi je suis architecte technique chez Carl.,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO,YES
4,"[DEV] Donc au R&D ça fait 7 ans que j''y suis, 8 ans.",NO,NO,NO,NO,NO,NO,NO,NO,NO,NO,UNKNOW'.

	model := ITWModel new. 
	importer := ITWModelImporter new model: model.
	importer fromCSVContents: content1; fromCSVContents: content2.
	self assert: (model allWithType: ITWInterviewer) size equals: 1.
	self assert: (model allWithType: ITWTheme) size equals: 11.
	self assert: (model allWithType: ITWSentence) size equals: 8.
	self
		assert: (model allWithType: ITWSentence) last nos size
		equals: 10.
	self assert: (model allWithType: ITWInterview) size equals: 2.
	self
		assert: (model allWithType: ITWInterview) anyOne sentences size
		equals: 4
]

{ #category : 'tests' }
ITWModelImporterTest >> testFromCSVContents [

	| model content |
	content := 'index, sentence, Documentation, Maintenance logiciel, Compréhension du code, Tickets Jira, Revue du code, Testabilité, Environnement de développement, Interopérabilité, Communication inter-équipes, Outils CI/CD
1, [INTERVIEWER] Ok c''est lancé., no, no, no, no, no, no, no, no, no, no
2, [INTERVIEWER] Du coup j''ai pas mal parlé là mais étant l''idée c''est que toi tu parles le plus ça te va., no, no, no, no, no, no, no, no, no, no'.

	model := ITWModel new. 
	ITWModelImporter new model: model; fromCSVContents: content. 
	self assert: (model allWithType: ITWInterviewer) size equals: 1.
	self assert: (model allWithType: ITWTheme) size equals: 10.
	self assert: (model allWithType: ITWSentence) size equals: 2.
	self
		assert: (model allWithType: ITWSentence) anyOne nos size
		equals: 10.
	self assert: (model allWithType: ITWInterview) size equals: 1.
	self
		assert: (model allWithType: ITWInterview) anyOne sentences size
		equals: 2
]

{ #category : 'tests' }
ITWModelImporterTest >> testFromCSVContents2 [

	| model content |
	content := 'index,sentence,Documentation,Maintenance logiciel,Compréhension du code,Tickets Jira,Revue du code,Testabilité,Environnement de développement,Interopérabilité,Communication inter-équipes,Outils CI/CD
1,"[INTERVIEWER] Ok, c''est lancé.",NO,NO,NO,NO,UNKNOW,NO,NO,NO,NO,NO
2,"[INTERVIEWER] Du coup, j''ai pas mal parlé là, mais étant l''idée c''est que toi tu parles le plus, ça te va.",NO,NO,unknown,NO,NO,NO,NO,NO,unknown,NO
3,"[INTERVIEWER] Je commence en général par demander aux gens de se présenter un petit peu, c''est-à-dire depuis qu''on est dans la boîte, tu m''as déjà dit, toi du coup tu es arrivé en...",NO,NO,NO,NO,NO,NO,NO,NO,YES,NO
4,[DEV] Moi je suis arrivé en mars 2018.,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO
'.

	model := ITWModel new. 
	ITWModelImporter new model: model; fromCSVContents: content. 
	self assert: (model allWithType: ITWInterviewer) size equals: 1.
	self assert: (model allWithType: ITWTheme) size equals: 10.
	self assert: (model allWithType: ITWSentence) size equals: 4.
	self
		assert: (model allWithType: ITWSentence) last nos size
		equals: 10.
	self assert: (model allWithType: ITWInterview) size equals: 1.
	self
		assert: (model allWithType: ITWInterview) anyOne sentences size
		equals: 4
]
