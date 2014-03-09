"
A FASTRefactoringTestData is a Class regrouping data for tests for the refactoring tool

"
Class {
	#name : #FASTRefactoringPharoTestData,
	#superclass : #Object,
	#category : #'FAST-Refactoring-Tests-Data'
}

{ #category : #tests }
FASTRefactoringPharoTestData >> doubleReturnMethod [
	self
		ifTrue: [ 
			self
				foo11;
				foo12.
			^ self bar1 ]
		ifFalse: [ 
			self
				foo21;
				foo22.
			^ self bar2 ]
]

{ #category : #tests }
FASTRefactoringPharoTestData >> ifTrueMethod [
	| temp |
	temp := true.
	temp ifTrue: [ self
				foo;
				inlineMethod;
				bar
	].
]

{ #category : #tests }
FASTRefactoringPharoTestData >> inlineMethod [
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp
]

{ #category : #tests }
FASTRefactoringPharoTestData >> return1 [
	true ifTrue: [ ^ 1 ]
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueCascadeMethod [
	true
		foo1;
		inlineMethod1;
		bar1;
		ifTrue: [ self m1 ]
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueMethod [
	true ifTrue: [ self
				foo;
				inlineMethod;
				bar
	].
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueNestedAndParallelMethod [
	true ifTrue: [ self
				foo1 ;
				inlineMethod1;
				bar1.
				true ifTrue: [ self m1 ]
	].	
	true ifTrue: [ self
				bar2 ;
				inlineMethod2;
				foo2.
				true ifTrue: [ self m2 ]
	].
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueNestedAndParallelTransformedMethod [
	self
		foo1;
		inlineMethod1;
		bar1.
	self m1.
	self
		bar2;
		inlineMethod2;
		foo2.
	self m2
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueNestedMethod [
	true ifTrue: [ self
				foo ;
				inlineMethod;
				bar.
				true ifTrue: [ self ]
	].
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueNestedTransformedMethod [
	self
		foo ;
		inlineMethod;
		bar.
		self
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueSimpleMethod [
	true
		ifTrue: [ ^ 1 ]
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueTransformedMethod [
	self
		foo;
		inlineMethod;
		bar
	
]
