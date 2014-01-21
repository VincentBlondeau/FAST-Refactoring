Extension { #name : #MooseEntity }

{ #category : #'*FAST-Refactoring-Extensions' }
MooseEntity >> childrenNodes [
	^self children
]

{ #category : #'*FAST-Refactoring-Extensions' }
MooseEntity >> parentNode [
	^ self belongsTo
]
