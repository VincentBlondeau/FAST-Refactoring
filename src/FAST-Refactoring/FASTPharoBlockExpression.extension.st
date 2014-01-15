Extension { #name : #FASTPharoBlockExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoBlockExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
