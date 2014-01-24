"
A FASTRefactoringTestData is a Class regrouping data for tests. 

"
Class {
	#name : #FASTRefactoringTestData,
	#superclass : #Object,
	#category : #'FAST-Refactoring-Tests-Data'
}

{ #category : #tests }
FASTRefactoringTestData >> ifTrueMethod [
	| temp |
	temp := true.
	temp ifTrue: [ self
				foo;
				inlineMethod;
				bar
	].
]

{ #category : #tests }
FASTRefactoringTestData >> inlineMethod [
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp
]

{ #category : #tests }
FASTRefactoringTestData >> trueIfTrueMethod [
	true ifTrue: [ self
				foo;
				inlineMethod;
				bar
	].
]

{ #category : #tests }
FASTRefactoringTestData >> trueIfTrueNestedMethod [
	true ifTrue: [ self
				foo ;
				inlineMethod;
				bar.
				true ifTrue: [ self ]
	].
]
