Extension { #name : #FASTEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> --> aTransformationMethodName [
	self asOrderedCollection --> aTransformationMethodName
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> add: anObject in: anAccessorReturningACollection [
	| collection |
	collection := self collectionFromAccessorNamed: anAccessorReturningACollection.
	anObject isCollection
		ifTrue: [ collection addAll: anObject ]
		ifFalse: [ collection add: anObject ].
	self updateOpposite: anAccessorReturningACollection
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> checkIsPerfomableSelector: anAccessor [
	(self class canPerform: anAccessor) ifFalse: 
		[ NotFound signal: anAccessor asString, ' in ', self class asString ].
	
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> classFilterValueFor: aCompiledMethod [
	 ^ (Pragma inMethod: aCompiledMethod named: #transformOn:) arguments first

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
FASTEntity >> isApplicableTransformation: aCompiledMethod [
	^ self isClassFilterValidIn: (self classFilterValueFor: aCompiledMethod)
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> isClassFilterValidIn: requiredClass [
	^ self class name = requiredClass or: [self class subclasses includes: requiredClass ]


]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> remove: anObject in: anAccessorReturningACollection [
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
	self flag: 'rename'.
	"Pragma inMethod: (self class lookupSelector:  aSelector asSymbol) named: #MSEProperty:type:opposite:."
	collection := self perform: aSelector.
	collection do: [ :e | e parentNode ifNil: [ "FASTERParentNodeNotSetWithFAMEAnnotations signal" ] ]

]
