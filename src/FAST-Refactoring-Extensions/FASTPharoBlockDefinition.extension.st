Extension { #name : #FASTPharoBlockDefinition }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoBlockDefinition >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
