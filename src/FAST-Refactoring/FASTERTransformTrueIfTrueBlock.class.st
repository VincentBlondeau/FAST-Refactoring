"
A FASTERTransformTrueIfTrueBlock is a small example of a FAST transformation.

The purpose is to remove a true ifTrue: [  ] expression.



"
Class {
	#name : #FASTERTransformTrueIfTrueBlock,
	#superclass : #FASTERTransform,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERTransformTrueIfTrueBlock >> searchTrueifTruePattern [
	<search>
	^ self find: FASTPharoMessageSend where: [ :a | a selector name = #ifTrue:]
]

{ #category : #transformation }
FASTERTransformTrueIfTrueBlock >> trueifTrueInlineBlock [
	<transformOn: FASTPharoMessageSend>
	| statementsCollection localVariables behaviouralEntity |
	behaviouralEntity := inNode parentNode parentNode .
	
	"Move the statements of the block to the upper BehaviouralEntity"
	statementsCollection := inNode arguments first block statements.
	behaviouralEntity add: statementsCollection insteadOf: inNode parentNode in: #statements.
	
	"Move the variables of the block to the upper BehaviouralEntity"
	localVariables := inNode arguments first block localVariables.
	behaviouralEntity addLast: localVariables in: #localVariables.
	
	^ behaviouralEntity
]
