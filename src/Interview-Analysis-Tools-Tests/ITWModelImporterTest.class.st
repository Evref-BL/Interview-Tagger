Class {
	#name : 'ITWModelImporterTest',
	#superclass : 'TestCase',
	#category : 'Interview-Analysis-Tools-Tests',
	#package : 'Interview-Analysis-Tools-Tests'
}

{ #category : 'tests' }
ITWModelImporterTest >> testFromCSVContents [

	|model content|
	content := 'index, sentence, Documentation, Maintenance logiciel, Compréhension du code, Tickets Jira, Revue du code, Testabilité, Environnement de développement, Interopérabilité, Communication inter-équipes, Outils CI/CD
1, [INTERVIEWER] Ok c''est lancé., no, no, no, no, no, no, no, no, no, no
2, [INTERVIEWER] Du coup j''ai pas mal parlé là mais étant l''idée c''est que toi tu parles le plus ça te va., no, no, no, no, no, no, no, no, no, no'.

	model := ITWModelImporter new fromCSVContents: content. 
	self assert: (model allWithType: ITWInterviewer ) size equals: 	1.
	self assert: (model allWithType: ITWTheme ) size equals: 	10.
	self assert: (model allWithType: ITWSentence ) size equals: 	2.
	self assert: (model allWithType: ITWSentence ) anyOne nos size equals: 	10.		
	self assert:  (model allWithType: ITWInterview ) size equals: 1.
	self assert:  (model allWithType: ITWInterview ) anyOne sentences size equals: 2.
]

{ #category : 'tests' }
ITWModelImporterTest >> testFromCSVContents2 [

	|model content|
	content := 'index,sentence,Documentation,Maintenance logiciel,Compréhension du code,Tickets Jira,Revue du code,Testabilité,Environnement de développement,Interopérabilité,Communication inter-équipes,Outils CI/CD
1,"[INTERVIEWER] Ok, c''est lancé.",NO,NO,NO,NO,UNKNOW,NO,NO,NO,NO,NO
2,"[INTERVIEWER] Du coup, j''ai pas mal parlé là, mais étant l''idée c''est que toi tu parles le plus, ça te va.",NO,NO,unknown,NO,NO,NO,NO,NO,unknown,NO
3,"[INTERVIEWER] Je commence en général par demander aux gens de se présenter un petit peu, c''est-à-dire depuis qu''on est dans la boîte, tu m''as déjà dit, toi du coup tu es arrivé en...",NO,NO,NO,NO,NO,NO,NO,NO,YES,NO
4,[DEV] Moi je suis arrivé en mars 2018.,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO
'.

	model := ITWModelImporter new fromCSVContents: content. 
	self assert: (model allWithType: ITWInterviewer ) size equals: 	1.
	self assert: (model allWithType: ITWTheme ) size equals: 	10.
	self assert: (model allWithType: ITWSentence ) size equals: 	4.
	self assert: (model allWithType: ITWSentence ) last nos size equals: 	10.		
	self assert:  (model allWithType: ITWInterview ) size equals: 	1.
	self assert:  (model allWithType: ITWInterview ) anyOne sentences size equals: 4.
]
