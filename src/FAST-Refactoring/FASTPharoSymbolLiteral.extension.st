Extension { #name : #FASTPharoSymbolLiteral }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoSymbolLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
