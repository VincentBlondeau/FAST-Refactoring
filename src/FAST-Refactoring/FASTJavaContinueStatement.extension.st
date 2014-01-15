Extension { #name : #FASTJavaContinueStatement }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaContinueStatement >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
