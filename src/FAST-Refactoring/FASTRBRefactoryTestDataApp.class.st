Class {
	#name : #FASTRBRefactoryTestDataApp,
	#superclass : #Object,
	#category : #'FAST-Refactoring-Tests-Data'
}

{ #category : #tests }
FASTRBRefactoryTestDataApp >> inlineMethod [
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp
]
