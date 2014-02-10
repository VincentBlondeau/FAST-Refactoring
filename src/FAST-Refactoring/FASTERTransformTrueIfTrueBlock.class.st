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
	behaviouralEntity := this parentNode parentNode .
	
	"Move the statements of the block to the upper BehaviouralEntity"
	statementsCollection := this arguments first block statements.
	behaviouralEntity add: statementsCollection in: #statements; remove: this parentNode from: #statements.
	
	"Move the variables of the block to the upper BehaviouralEntity"
	localVariables := this arguments first block localVariables.
	behaviouralEntity add: localVariables in: #localVariables.
	
	^ behaviouralEntity
]
