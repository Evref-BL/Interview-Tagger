Extension { #name : 'OrderedCollection' }

{ #category : '*Moose-Collection-Extension' }
OrderedCollection >> add: newObject unless: aConditionAsBlock [
	^ (self addAll: { newObject } unless: aConditionAsBlock) first
]

{ #category : '*Moose-Collection-Extension' }
OrderedCollection >> addAll: anElmtCollection unless: aConditionAsBlock [
	| returnCollection |
	"Create same kind of collection"
	returnCollection := self species new.
	"For each element of this collection"

	anElmtCollection do: [ :anElmt |
		self
			detect: [ :existingElmt |
			aConditionAsBlock value: existingElmt value: anElmt ]
			ifFound: [ :el | returnCollection add: el ]
			ifNone: [
				returnCollection add: anElmt.
				self add: anElmt ] ].

	^ returnCollection
]
