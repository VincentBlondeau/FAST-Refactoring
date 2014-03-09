"
A FASTERExtensionTest is a test class for the added methods in FASTEntity. The methods are mainly used for add nodes to another node collection 
"
Class {
	#name : #FASTERExtensionTest,
	#superclass : #FASTERTest,
	#instVars : [
		'method',
		'entityToRemoveOne',
		'entityToRemoveTwo',
		'entities',
		'entitiesToRemove',
		'entityStatement',
		'entityNamedVariable',
		'entityStatementBlock'
	],
	#category : #'FAST-Refactoring-Tests-Extensions'
}

{ #category : #tests }
FASTERExtensionTest >> setUp [
	super setUp.
	entityNamedVariable := FASTNamedEntity new.
	entityStatementBlock := FASTStatementBlock new.
	entityStatement := FASTStatement new.
	entities := { entityNamedVariable . entityStatementBlock } asOrderedCollection.
	entityToRemoveOne := FASTNamedEntity new.
	entityToRemoveTwo := FASTStatementBlock new.
	entitiesToRemove := { entityToRemoveOne . entityToRemoveTwo } asOrderedCollection.
	method := FASTPharoMethodEntity new name: 'myName';yourself.
]

{ #category : #tests }
FASTERExtensionTest >> testAddInAnInexsistantVariableShouldRaiseANotFoundException [
	self should: [ method addLast: entityNamedVariable in: #variablesLocales ] raise: NotFound
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddAFASTEntityInMethodStatements [
	method addLast: entityStatement in: #statements.
	self assert: method statements size = 1.
	self assert: method statements first == entityStatement.
	self assert: entityStatement parentNode equals: method
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddAFASTEntityInStatements [
	entityStatementBlock addLast: entityStatement in: #statements.
	self assert: entityStatementBlock statements size = 1.
	self assert: entityStatementBlock statements first == entityStatement.
	self assert: entityStatement parentNode equals: entityStatementBlock
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddAFASTEntityInTheLocalVariableInstanceVariable [
	method addLast: entityNamedVariable in: #localVariables.
	self assert: method localVariables size = 1.
	self assert: method localVariables first == entityNamedVariable.
]

{ #category : #tests }
FASTERExtensionTest >> testAddInShouldAddTwoFASTEntitiesInTheLocalVariableInstanceVariable [
	method addLast: entities in: #localVariables.
	self assert: method localVariables size = 2.
	self assert: (method localVariables includes: entityNamedVariable).
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInAnInexsistantVariableShouldRaiseANotFoundException [
	self should: [ method remove: entityToRemoveOne from: #thisSelectorDoesntExists ] raise: NotFound
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInCollectionWhichDoesntContainTheVariableShouldRaiseANotFoundException [
	self should: [ method remove: entityNamedVariable from: #localVariables ] raise: NotFound
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInShouldRemoveTheFASTEntityInTheLocalVariableInstanceVariable [
	method localVariables addAll: entities.
	method remove: entityNamedVariable from: #localVariables.
	self assert: (method localVariables includes: entityStatementBlock).
]

{ #category : #tests }
FASTERExtensionTest >> testRemoveInShouldRemoveTwoFASTEntitiesInTheLocalVariableInstanceVariable [
	method localVariables addAll: entities.
	method localVariables addAll: entitiesToRemove.
	method remove: entitiesToRemove from: #localVariables.
	self assert: method localVariables isCollection.
	self assert: (method localVariables includesAll: entities).
]
