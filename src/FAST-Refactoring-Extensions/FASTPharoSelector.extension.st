Extension { #name : #FASTPharoSelector }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoSelector >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
