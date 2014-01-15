Extension { #name : #FASTPharoBlockDefinition }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoBlockDefinition >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
