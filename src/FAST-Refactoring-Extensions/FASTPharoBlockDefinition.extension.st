Extension { #name : #FASTPharoBlockDefinition }

{ #category : #'*FAST-Refactoring-Extensions' }
FASTPharoBlockDefinition >> childrenNodes [
	self flag: 'breaking proper inheritance between FASTPharoMethodEntity and FASTAnonymousBehaviouralEntity'.
	^ (parameters union: localVariables) union: statements
]
