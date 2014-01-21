Extension { #name : #FASTPharoByteArrayLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoByteArrayLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
