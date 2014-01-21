Extension { #name : #FASTJavaCaseStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaCaseStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
