Extension { #name : #FASTPharoArrayLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoArrayLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
