Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaWhileStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
