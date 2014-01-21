Extension { #name : #FASTExpression }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
