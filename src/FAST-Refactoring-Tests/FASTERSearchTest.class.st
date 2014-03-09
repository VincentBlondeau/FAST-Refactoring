"
A FASTERSearchTest is an abstract class regrouping all the methods for testing the FAST-Refactoring tools

Instance Variables
	fasterInstance:		aFASTERSearch subclass

fasterInstance
	- it's a instance of the class returned by fasterClass which model IV is set to the model in Tests-Data. fasterClass must be implemented in all the subclasses an the fasterInstance used to  do the transformation or the search.

"
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
	"Set the transformation class that has to be instancied to run the tests"
	self subclassResponsibility 
]

{ #category : #running }
FASTERSearchTest >> setUp [
	super setUp.
	fasterInstance := self fasterClass new
]
