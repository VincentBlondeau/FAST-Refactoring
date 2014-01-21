Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTVariableExpression >> childrenNodes [
	^ { variable } asOrderedCollection  
]

{ #category : #'*FAST-Refactoring-Extensions' }
FASTVariableExpression >> mooseNameOn: aStream [
	aStream nextPutAll: self name
]
