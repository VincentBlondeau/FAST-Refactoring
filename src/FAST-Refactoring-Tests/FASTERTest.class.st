"
A FASTERTest is a super class containing few initialisation methods for FAST-Refactorings.

Instance Variables
	model:		aMooseModel

model
	- The model loaded from FAST-Refactoring-Tests-Data

"
Class {
	#name : #FASTERTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #generating }
FASTERTest >> generateFASTOnModel: aModel [
	aModel allMethods do: [ :m | m fastBehaviouralEntity ifNil: [ m generateFAST ] ]
]

{ #category : #generating }
FASTERTest >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'FAST-Refactoring-Tests-Data';
		run
]

{ #category : #accessing }
FASTERTest >> methodNamed: aMethodName [
	^ self model allMethods detect: [ :m | m name = aMethodName ]
]

{ #category : #accessing }
FASTERTest >> model [
	^ model
	
]

{ #category : #accessing }
FASTERTest >> model: aModel [
	model := aModel
	
]

{ #category : #running }
FASTERTest >> setUp [
	self model: MooseModel new.
	self importModel.
	self generateFASTOnModel: self model.
]
