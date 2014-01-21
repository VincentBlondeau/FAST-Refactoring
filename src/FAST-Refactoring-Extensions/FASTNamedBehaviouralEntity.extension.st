Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTNamedBehaviouralEntity >> childrenNodes [
	self flag: 'To remove after'.
	self subclassResponsibility 
]
