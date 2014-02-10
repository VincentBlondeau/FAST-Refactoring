Class {
	#name : #FASTERTrueIfTrueSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'as yet unclassified' }
FASTERTrueIfTrueSearch >> searchTrueifTruePattern [
	<search>
	^ self
		find: FASTPharoMessageSend
		where:
			[ :a | a selector name = #ifTrue: and: [ (a concreteReceiver is: FASTBooleanLiteral) and: [ a concreteReceiver value = 'true' ] ] ]
				
]
