Class {
	#name : #FASTERTrueIfTrueEnhancedSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Search-Examples'
}

{ #category : #'transformation - root' }
FASTERTrueIfTrueEnhancedSearch >> entryPoint [
	self
		find: FASTBehaviouralEntity
		in: self scope
		where: [ :aNode |
			self
				find: FASTPharoMessageSend
				in: aNode
				where: [ :eachSelector | self find: FASTPharoSelector in: eachSelector where: [ :s | s name = 'ifTrue:' ] ] ]
]
