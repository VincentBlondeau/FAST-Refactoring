Class {
	#name : #FASTERSearchTest,
	#superclass : #FASTERTest,
	#instVars : [
		'search'
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
	search := self fasterClass new
		model: self model.
]
