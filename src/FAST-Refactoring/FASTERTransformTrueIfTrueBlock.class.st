"
A FASTERTransformTrueIfTrueBlock is a small example of a FAST transformation.

The purpose is to remove a true ifTrue: [  ] expression.



"
Class {
	#name : #FASTERTransformTrueIfTrueBlock,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERTransformTrueIfTrueBlock >> trueifTrueInlineBlock [
	<transform>
	<on: FASTPharoMessageSend>
	| statementsCollection localVariables |
	"Move the statements of the block to the upper BehaviouralEntity"
	statementsCollection := this arguments first block statements.
	this parentNode parentNode add: statementsCollection in: #statements; remove: this parentNode in: #statements.
	
	"Shouldn't be neccesary if the FMMultiLink is solved !"
	statementsCollection do: [ :statement | statement parentNode: this parentNode parentNode ].
	
	"Move the variables of the block to the upper BehaviouralEntity"
	localVariables := this arguments first block localVariables.
	this parentNode parentNode add: localVariables in: #localVariables.
	
	"Shouldn't be neccesary if the FMMultiLink is solved !"
	statementsCollection do: [ :localVariable | localVariable parentNode: this parentNode parentNode ].
]
