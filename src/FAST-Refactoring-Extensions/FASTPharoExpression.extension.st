Extension { #name : #FASTPharoExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
