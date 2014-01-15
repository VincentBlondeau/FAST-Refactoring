Extension { #name : #FASTPharoNumberLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoNumberLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
