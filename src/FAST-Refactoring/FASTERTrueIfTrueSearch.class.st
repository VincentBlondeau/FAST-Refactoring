Class {
	#name : #FASTERTrueIfTrueSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Search-Examples'
}

{ #category : #'transformation - root' }
FASTERTrueIfTrueSearch >> entryPoint [
	self
		findInScope: FASTPharoMessageSend
		where: [ :a | a selector name = #ifTrue: and: [ (a receiver is: FASTBooleanLiteral) and: [ a receiver value = 'true' ] ] ]
]
