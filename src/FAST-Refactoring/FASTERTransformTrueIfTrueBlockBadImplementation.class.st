"
A FASTERTransformTrueIfTrueBlock is a small bad example of a FAST transformation.

The purpose is to remove a true ifTrue: [  .. ] expression by inlining the content of the block.

This implementation of the transformation is not good.
Indeed the only rule applied on a aNode modify the ancestors of the node itself and it should not be.
"
Class {
	#name : #FASTERTransformTrueIfTrueBlockBadImplementation,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Transformation-Examples'
}

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockBadImplementation >> entryPoint [
	^ self find: FASTPharoMessageSend in: self scope where: [ :a | a selector name = #ifTrue:]
]

{ #category : #transformation }
FASTERTransformTrueIfTrueBlockBadImplementation >> trueifTrueInlineBlock: aNode [
	<transformOn: #FASTPharoMessageSend>
	| statementsCollection localVariables behaviouralEntity |
	behaviouralEntity := aNode parentNode parentNode .
	
	"Move the statements of the block to the upper BehaviouralEntity"
	statementsCollection := aNode arguments first block statements.
	behaviouralEntity add: statementsCollection insteadOf: aNode parentNode in: #statements.
	
	"Move the variables of the block to the upper BehaviouralEntity"
	localVariables := aNode arguments first block localVariables.
	behaviouralEntity addLast: localVariables in: #localVariables.
	
	^ behaviouralEntity
]
