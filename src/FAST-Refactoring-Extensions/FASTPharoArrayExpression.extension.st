Extension { #name : #FASTPharoArrayExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoArrayExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
