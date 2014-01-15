Class {
	#name : #FASTERExtensionTest,
	#superclass : #FASTERTest,
	#instVars : [
		'method',
		'entityToRemoveOne',
		'entityToRemoveTwo',
		'entityOne',
		'entityTwo',
		'entities',
		'entitiesToRemove'
	],
	#category : #'FAST-Refactoring-Tests-Extensions'
}

{ #category : #tests }
FASTERExtensionTest >> setUp [
	super setUp.
	entityOne := FASTNamedEntity new.
	entityTwo := FASTStatementBlock new.
	entities := { entityOne . entityTwo } asOrderedCollection.
	entityToRemoveOne := FASTNamedEntity new.
	entityToRemoveTwo := FASTStatementBlock new.
	entitiesToRemove := { entityToRemoveOne . entityToRemoveTwo } asOrderedCollection.
	method := FASTPharoMethodEntity new name: 'myName';yourself.
]

{ #category : #tests }
FASTERExtensionTest >> testAddInAnInexsistantVariableShouldRaiseANotFoundException [
	self should: [method add: entityOne in: #variablesLocales] raise: NotFound.
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddAFASTEntityInTheLocalVariableInstanceVariable [
	method add: entityOne in: #localVariables.
	self assert: method localVariables size = 1.
	self assert: method localVariables first == entityOne.
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddTwoFASTEntitiesInTheLocalVariableInstanceVariable [
	method add: entities in: #localVariables.
	self assert: method localVariables size = 2.
	self assert: (method localVariables includes: entityOne).
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInAnInexsistantVariableShouldRaiseANotFoundException [
	self should: [method remove: entity in: #variablesLocales] raise: NotFound.
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInCollectionWhichDoesntContainTheVariableShouldRaiseANotFoundException [
	self should: [method remove: entityOne in: #localVariables] raise: NotFound.
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInShouldRemoveTheFASTEntityInTheLocalVariableInstanceVariable [
	method localVariables addAll: entities.
	method remove: entityOne in: #localVariables.
	self assert: (method localVariables includes: entityTwo).
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInShouldRemoveTwoFASTEntitiesInTheLocalVariableInstanceVariable [
	method localVariables addAll: entities.
	method localVariables addAll: entitiesToRemove.
	method remove: entitiesToRemove in: #localVariables.
	self assert: method localVariables isCollection.
	self assert: (method localVariables includesAll: entities).
]
