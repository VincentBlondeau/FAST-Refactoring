Extension { #name : #MooseEntity }

{ #category : #'*FAST-Displaying' }
MooseEntity >> childrenNodes [
	"Presume (at wrong) it is the default method to get the children of a Moose Object"

	self flag: 'Should be implemented for each kind of MooseEntity and remplaced here by "self subclassResponsibility"'.
	^ self children
]

{ #category : #'*FAST-Displaying' }
MooseEntity >> display [
	FASTERDisplay display: self
]

{ #category : #'*FAST-Displaying' }
MooseEntity >> parentNode [
	"Presume (at wrong) it is the default method to get the parent of a Moose Object"

	self flag: 'Should be implemented for each kind of MooseEntity and remplaced here by "self subclassResponsibility"'.
	^ self belongsTo
]
