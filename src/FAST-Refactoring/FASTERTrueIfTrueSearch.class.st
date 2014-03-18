Class {
	#name : #FASTERTrueIfTrueSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Search-Examples'
}

{ #category : #'transformation - root' }
FASTERTrueIfTrueSearch >> entryPoint [
	self
		find: FASTPharoMessageSend
		in: self scope
		where: [ :a | a selector name = #ifTrue: and: [ (a receiver is: FASTBooleanLiteral) and: [ a receiver value = 'true' ] ] ]
]
