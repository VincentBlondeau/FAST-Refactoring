Extension { #name : #FASTPharoExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
