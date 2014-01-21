Extension { #name : #FASTPharoMethodEntity }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoMethodEntity >> childrenNodes [
	self flag: 'breaking proper inheritance between FASTPharoMethodEntity and FASTAnonymousBehaviouralEntity'.
	^ (parameters union: localVariables) union: statements
]
