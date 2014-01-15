Class {
	#name : #FASTRBRefactoryTestDataApp,
	#superclass : #Object,
	#category : #'FAST-Refactoring-RBTests-Data'
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
