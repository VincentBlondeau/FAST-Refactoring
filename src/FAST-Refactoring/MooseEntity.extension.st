Extension { #name : #MooseEntity }

{ #category : #'*FAST-Refactoring-Core' }
MooseEntity >> parentUntil: anEntityClass [
	self class asString = anEntityClass asString 
		ifTrue: [ ^ self ] 
		ifFalse: [ ^ self parentNode parentUntil: anEntityClass ]
]
