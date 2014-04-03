Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*FAST-Displaying' }
FAMIXBehaviouralEntity >> childrenNodes [
	"Presume (maybe at wrong) it is the default method to get the children of a FAMIXBehaviouralEntity"

	self flag: 'Should be reimplemented for supporting MooseModel displaying'.
	^ { self fastBehaviouralEntity } asOrderedCollection
]
