Extension { #name : #FASTPharoArrayExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoArrayExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
