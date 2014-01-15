Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTNamedBehaviouralEntity >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
