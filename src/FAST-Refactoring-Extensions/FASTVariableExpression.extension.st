Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTVariableExpression >> childrenNodes [
	^ { variable } asOrderedCollection  
]
