Class {
	#name : #FASTERTransformTrueIfTrueBlock,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #transformation }
FASTERTransformTrueIfTrueBlock >> transformFASTPharoMessageSend [
	| statementsCollection localVariables |
	statementsCollection := this arguments first block statements.
	this parentNode parentNode add: statementsCollection in: #statements; remove: this parentNode in: #statements.
	statementsCollection do: [ :statement | statement parentNode: this parentNode parentNode ].
	localVariables := this arguments first block localVariables.
	this parentNode parentNode add: localVariables in: #localVariables.
	statementsCollection do: [ :localVariable | localVariable parentNode: this parentNode parentNode ].
]
