Extension { #name : #FASTJavaIdentifier }

{ #category : #'*FAST-Refactoring-Core' }
FASTJavaIdentifier >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
