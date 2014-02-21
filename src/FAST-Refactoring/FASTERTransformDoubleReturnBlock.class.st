Class {
	#name : #FASTERTransformDoubleReturnBlock,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> containsATwoArgumentsMessageSend: aNode [
	"look if there is some two argument message send in children"
	^ self halt.
]

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> entryPoint [
	^ self apply: #transformFASTExpressionStatementContainingATwoArgumentsMessageSend on: self scope fastNamedBehaviouralEntity
]

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> getReturnStatementsFrom: aNode [
	<transformOn: #FASTReturnStatement>
	^ aNode expression
]

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> hasTwoArgumentsWhichAreBlocks: aNode [
	^ aNode arguments size = 2 halt.
]

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> transformFASTExpressionStatementContainingATwoArgumentsMessageSend: aNode [
	<transformOn: #FASTExpressionStatement where: #containsATwoArgumentsMessageSend>
	| res |
	res := self apply: #transformFASTPharoMessageSendWithTwoArguments on: aNode.
	res ifNotNil: [ FASTReturnStatement new expression: res ].
	^ nil
]

{ #category : #'transformation - root' }
FASTERTransformDoubleReturnBlock >> transformFASTPharoMessageSendWithTwoArguments: aNode [
	<transformOn: #FASTPharoMessageSend where: #hasTwoArgumentsWhichAreBlocks>
	| first second |
	first := self apply: #getReturnStatementsFrom on: aNode arguments first block. "should answer nil or an element"
	second := self apply: #getReturnStatementsFrom on: aNode arguments second block.
	(first isNotNil and: [ second isNotNil ])
		ifTrue: [ 
			aNode arguments first block
				add: (FASTExpressionStatement new expression: first first)
				insteadOf: aNode arguments first block statements last
				in: #statements.
			aNode arguments second block
				add: (FASTExpressionStatement new expression: second first)
				insteadOf: aNode arguments second block statements last
				in: #statements.
			^ aNode ].
		^ nil
]
