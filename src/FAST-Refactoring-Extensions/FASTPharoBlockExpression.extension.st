Extension { #name : #FASTPharoBlockExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoBlockExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
