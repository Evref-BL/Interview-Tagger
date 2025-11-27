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
]
