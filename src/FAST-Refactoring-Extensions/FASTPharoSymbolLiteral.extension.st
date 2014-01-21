Extension { #name : #FASTPharoSymbolLiteral }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoSymbolLiteral >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
