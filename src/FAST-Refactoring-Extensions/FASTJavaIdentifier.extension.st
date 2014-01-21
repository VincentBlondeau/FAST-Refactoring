Extension { #name : #FASTJavaIdentifier }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTJavaIdentifier >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
