Extension { #name : #FASTPharoNumberLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoNumberLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
