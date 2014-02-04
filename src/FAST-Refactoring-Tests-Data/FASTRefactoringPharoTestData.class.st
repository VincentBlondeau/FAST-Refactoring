"
A FASTRefactoringTestData is a Class regrouping data for tests. 

"
Class {
	#name : #FASTRefactoringPharoTestData,
	#superclass : #Object,
	#category : #'FAST-Refactoring-Tests-Data'
}

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
				foo ;
				inlineMethod;
				bar.
				true ifTrue: [ self ]
	].	
	true ifTrue: [ self
				bar ;
				inlineMethod;
				foo.
				true ifTrue: [ self ]
	].
]

{ #category : #tests }
FASTRefactoringPharoTestData >> trueIfTrueNestedAndParallelTransformedMethod [
	self
		foo;
		inlineMethod;
		bar.
	self.
	self
		bar;
		inlineMethod;
		foo.
	self
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
FASTRefactoringPharoTestData >> trueIfTrueTransformedMethod [
	self
		foo;
		inlineMethod;
		bar
	
]
