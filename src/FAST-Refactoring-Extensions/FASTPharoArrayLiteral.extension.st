Extension { #name : #FASTPharoArrayLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoArrayLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
