Extension { #name : #FASTPharoMethodEntity }

{ #category : #'*FAST-Refactoring-Core' }
FASTPharoMethodEntity >> childrenNodes [
	self flag: 'breaking proper inheritance between FASTPharoMethodEntity and FASTAnonymousBehaviouralEntity'.
	^ (parameters union: localVariables) union: statements
]
