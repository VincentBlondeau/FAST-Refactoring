Class {
	#name : #FASTERSearchTest,
	#superclass : #FASTERTest,
	#instVars : [
		'fasterInstance'
	],
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #accessing }
FASTERSearchTest >> fasterClass [
	self subclassResponsibility 
]

{ #category : #running }
FASTERSearchTest >> setUp [
	super setUp.
	fasterInstance := self fasterClass new
		model: self model.
]
