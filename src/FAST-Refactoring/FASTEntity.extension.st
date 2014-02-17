Extension { #name : #FASTEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> add: anObject after: anAfterObject in: anAccessorReturningACollection [
	| collection |
	collection := self collectionFromAccessorNamed: anAccessorReturningACollection.
	anObject isCollection
		ifTrue: [ anObject reverseDo: [ :each | collection add: each after: anAfterObject ]]
		ifFalse: [ collection add: anObject after: anAfterObject].
	self updateOpposite: anAccessorReturningACollection
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> add: anObject insteadOf: anAfterObject in: anAccessorReturningACollection [
	self add: anObject after: anAfterObject in: anAccessorReturningACollection.
	self remove: anAfterObject from: anAccessorReturningACollection
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> addLast: anObject in: anAccessorReturningACollection [
	"As FMMultivalueLink use the add: method form OrderedCollection which use the addLast method, we can use the add: method here !"
	| collection |
	collection := self collectionFromAccessorNamed: anAccessorReturningACollection.
	anObject isCollection
		ifTrue: [ anObject do: [ :each | collection add: each ]]
		ifFalse: [ collection add: anObject ].
	self updateOpposite: anAccessorReturningACollection
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> checkIsPerfomableSelector: anAccessor [
	(self class canPerform: anAccessor) ifFalse: 
		[ NotFound signal: anAccessor asString, ' in ', self class asString ].
	
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> collectionFromAccessorNamed: anAccessorReturningACollection. [
	self checkIsPerfomableSelector: anAccessorReturningACollection.
	^self perform: anAccessorReturningACollection
	
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> is: aClass [
	^ self class = aClass
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> isAKindOf: requiredClass [
	^ self class name = requiredClass or: [requiredClass asClass allSubclasses includes: self class ]


]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> remove: anObject from: anAccessorReturningACollection [
	| collection |
	collection := self collectionFromAccessorNamed: anAccessorReturningACollection.
	anObject isCollection
		ifTrue: [ collection removeAll: anObject ]
		ifFalse: [ collection remove: anObject ]
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> updateOpposite: aSelector [
	| collection |
	"check if the annotations for the metamodel are correctly set. So if the parents nodes are set"
	collection := self perform: aSelector.
	collection do: [ :e | e parentNode ifNil: [ FASTERParentNodeNotSetByFAME signal ] ]

]
