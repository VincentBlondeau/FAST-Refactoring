Extension { #name : #FASTExpression }

{ #category : #'*FAST-Refactoring-Core' }
FASTExpression >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
