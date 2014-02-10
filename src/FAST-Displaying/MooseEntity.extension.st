Extension { #name : #MooseEntity }

{ #category : #'*FAST-Displaying' }
MooseEntity >> childrenNodes [
	^self children
]

{ #category : #'*FAST-Displaying' }
MooseEntity >> display [
	FASTERDisplay display: self
]

{ #category : #'*FAST-Displaying' }
MooseEntity >> parentNode [
	^ self belongsTo
]
