Extension { #name : 'ITWModel' }

{ #category : '*Interview-Tagger-Model-Extension' }
ITWModel >> collectThemeNames [

	^  ((self allWithType: ITWTheme) collect: #name) sorted
]
