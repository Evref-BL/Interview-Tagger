# Interview-Tagger
Interview Tagger is an simple modeling and manager for written interview between two actors. It allows you to tag each lines by themes and navigate them.  

## metacello
```smalltalk
Metacello new
  baseline: 'InterviewTagger';
  repository: 'github://Evref-BL/Interview-Tagger:main/src';
  load.
```

## example

how to setup your csv file
```csv
index,sentence,Documentation,Maintenance logiciel,Compréhension du code,Tickets Jira,Revue du code,Testabilité,Environnement de développement,Interopérabilité,Communication inter-équipes,Outils CI/CD
1,"[INTERVIEWER] Ok, c'est lancé.",NO,NO,NO,NO,UNKNOW,NO,NO,NO,NO,NO
2,"[INTERVIEWER] Du coup, j'ai pas mal parlé là, mais étant l'idée c'est que toi tu parles le plus, ça te va.",NO,NO,unknown,NO,NO,NO,NO,NO,unknown,NO
3,"[INTERVIEWER] Je commence en général par demander aux gens de se présenter un petit peu, c'est-à-dire depuis qu'on est dans la boîte, tu m'as déjà dit, toi du coup tu es arrivé en...",NO,NO,NO,NO,NO,NO,NO,NO,YES,NO
4,[DEV] Moi je suis arrivé en mars 2018.,NO,NO,NO,NO,NO,NO,NO,NO,NO,NO
```
example in smalltalk on how to use it
```smalltalk
interview := (ITWModelImporter fromCSV: '/Users/my-interview-annotated.csv') .

(ITWEditerPresenter on: interview) open.
InterviewLoader new model: interview mooseModel; interview: interview; exportToCSV. 
```

This provide a UI to edit your Interview (Work In Progress)

<img width="1002" height="499" alt="image" src="https://github.com/user-attachments/assets/8145808a-3f38-4d0e-9d03-51e08643b048" />
