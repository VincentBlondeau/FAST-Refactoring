Extension { #name : #FASTPharoByteArrayLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoByteArrayLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
