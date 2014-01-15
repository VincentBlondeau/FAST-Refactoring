Extension { #name : #FASTPharoSelector }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoSelector >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
