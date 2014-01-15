Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTVariableExpression >> childrenNodes [
	^ { variable } asOrderedCollection  
]

{ #category : #'*FAST-Refactoring-Core' }
FASTVariableExpression >> mooseNameOn: aStream [
	aStream nextPutAll: self name
]
