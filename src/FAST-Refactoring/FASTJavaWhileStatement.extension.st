Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaWhileStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
