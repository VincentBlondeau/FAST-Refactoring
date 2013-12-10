Class {
	#name : #MockFAST,
	#superclass : #TestCase,
	#category : #'FAST-Refactoring-Temp'
}

{ #category : #tests }
MockFAST >> sourceText [
	^ 'inlineMethod
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp'
]

{ #category : #tests }
MockFAST >> text2 [
	^ 'inlineMethod
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp'
]

{ #category : #tests }
MockFAST >> textSimple [
	^ 'inlineMethod
	^0'
]
