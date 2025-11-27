Class {
	#name : 'BaselineOfInterviewTagger',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfInterviewTagger',
	#package : 'BaselineOfInterviewTagger'
}

{ #category : 'baselines' }
BaselineOfInterviewTagger >> baseline: spec [

	<baseline>
	spec for: #common do: [
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfInterviewTagger >> defineDependencies: spec [

	spec
		baseline: 'LLMAPI'
		with: [ spec repository: 'github://Evref-BL/Pharo-LLMAPI:main/src' ]
]

{ #category : 'baselines' }
BaselineOfInterviewTagger >> defineGroups: spec [
]

{ #category : 'baselines' }
BaselineOfInterviewTagger >> definePackages: spec [
	
	spec
		package: 'Interview-Analysis-Tools' with: [ spec requires: #( 'Moose-Collection-Extension' ) ];
		package: 'Interview-Tagger-Spec' with: [ spec requires: #( 'Interview-Tagger-Model' ) ];
		package: 'Interview-Tagger-Model-Extension' with: [ spec requires: #( 'Interview-Tagger-Model' ) ];
		package: 'Interview-Tagger-Model';
		package: 'Interview-Tagger-Generator';
		package: 'Interview-Analysis-Tools-Tests'  with: [ spec requires: #( 'Interview-Analysis-Tools' ) ];
		package: 'Interview-Analysis-Tools' with: [ spec requires: #( 'LLMAPI' ) ]
]
