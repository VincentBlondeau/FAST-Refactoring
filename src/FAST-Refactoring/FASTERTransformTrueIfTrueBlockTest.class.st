Class {
	#name : #FASTERTransformTrueIfTrueBlockTest,
	#superclass : #FASTERSearchTest,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueBlockRemovalTransformation [
	| searchBlock |
	"FASTERDisplay display: (self methodNamed: #trueIfTrueMethod)."
	fastSearch scope: (self methodNamed: #trueIfTrueMethod).
	searchBlock := [ fastSearch find: FASTPharoMessageSend where: 
			[ :node | node selector name = #ifTrue: and: [ node concreteReceiver value = 'true']]].
	
	self assert: searchBlock value isNotEmpty.
	
	searchBlock value --> #FASTERTransformTrueIfTrueBlock.
	
	self assert: searchBlock value isEmpty.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"self assert: (self methodNamed: #trueIfTrueMethod) childrenNodes childrenNodes equals: (self methodNamed: #trueIfTrueTransformedMethod) childrenNodes childrenNodes"
	fastSearch findAll do: [ :fastEntity | self assert: fastEntity parentNode isNotNil ].
	"FASTERDisplay display: (self methodNamed: #trueIfTrueMethod)."
	"FASTERDisplay display: (self methodNamed: #trueIfTrueTransformedMethod)."
]

{ #category : #tests }
FASTERTransformTrueIfTrueBlockTest >> testTrueIfTrueNestedBlockRemovalTransformation [
	| searchBlock |
	FASTERDisplay display: (self methodNamed: #trueIfTrueNestedMethod).
	fastSearch scope: (self methodNamed: #trueIfTrueNestedMethod).
	searchBlock := [ fastSearch find: FASTPharoMessageSend where: 
			[ :a | a selector name = #ifTrue: and: [ a concreteReceiver value = 'true']]].
	
	self assert: searchBlock value isNotEmpty.
	
	searchBlock value --> #FASTERTransformTrueIfTrueBlock.
	
	self assert: searchBlock value isEmpty.
	self assert: (fastSearch find: FASTPharoBlockDefinition) isEmpty.
	self assert: (fastSearch find: FASTPharoBlockExpression) isEmpty.
	"FASTERDisplay display: (self methodNamed: #trueIfTrueNestedMethod).
	FASTERDisplay display: (self methodNamed: #trueIfTrueNestedTransformedMethod)."

]
