Class {
	#name : #FASTERTest,
	#superclass : #TestCase,
	#category : #'FAST-Refactoring-Tests-Core'
}

{ #category : #generating }
FASTERTest >> generateFASTOnModel: aModel [
	aModel allMethods do: 
		[:m | m fastNamedBehaviouralEntity ifNil: [m generateFAST]].
	
]

{ #category : #accessing }
FASTERTest >> model [
	^(MooseModel root at: 1)
]

{ #category : #running }
FASTERTest >> setUp [
	self generateFASTOnModel: self model.
]
