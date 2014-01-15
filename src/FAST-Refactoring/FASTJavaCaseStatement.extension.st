Extension { #name : #FASTJavaCaseStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaCaseStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
