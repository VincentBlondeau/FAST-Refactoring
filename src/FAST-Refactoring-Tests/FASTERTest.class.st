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
	aModel allMethods do: 
		[:m | m fastNamedBehaviouralEntity ifNil: [m generateFAST]].
	
]

{ #category : #generating }
FASTERTest >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'FAST-Refactoring-Tests-Data';
		run.
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
