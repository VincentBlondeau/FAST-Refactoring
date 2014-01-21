Extension { #name : #FASTEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> --> aTransformationMethodName [
	self asOrderedCollection --> aTransformationMethodName
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> add: anObject in: anInstanceVarCollection [
	| var |
	var := self instanceVariableNamed: anInstanceVarCollection.
	anObject isCollection 
		ifTrue: [ var addAll: anObject ]
		ifFalse: [ var add: anObject ]. 
	
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> instanceVariableNamed: anInstanceVarName [
	| index |
	index := self class instVarIndexFor: anInstanceVarName.
	(index = 0) ifTrue: [ NotFound signal ].
	^ (self instVarAt: index)
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> is: aClass [
	^ self class = aClass
]

{ #category : #'*FAST-Refactoring-Core' }
FASTEntity >> remove: anObject in: anInstanceVarCollection [
	| var |
	var := self instanceVariableNamed: anInstanceVarCollection.
	anObject isCollection 
		ifTrue: [ var removeAll: anObject ]
		ifFalse: [ var remove: anObject ]. 
	
]
