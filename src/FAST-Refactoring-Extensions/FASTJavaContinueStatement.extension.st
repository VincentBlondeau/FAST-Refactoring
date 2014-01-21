Extension { #name : #FASTJavaContinueStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaContinueStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
