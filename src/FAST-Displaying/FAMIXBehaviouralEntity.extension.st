Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*FAST-Displaying' }
FAMIXBehaviouralEntity >> childrenNodes [
	^ { self fastNamedBehaviouralEntity } asOrderedCollection
]
