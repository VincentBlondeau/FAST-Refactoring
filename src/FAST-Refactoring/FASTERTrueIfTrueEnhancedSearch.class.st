Class {
	#name : #FASTERTrueIfTrueEnhancedSearch,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Examples'
}

{ #category : #'transformation - root' }
FASTERTrueIfTrueEnhancedSearch >> entryPoint [
	self
		findInScope: FASTBehaviouralEntity
		where: [ :aNode |
			self
				find: FASTPharoMessageSend
				in: aNode
				where: [ :eachSelector | 
					eachSelector selector name = 'ifTrue:' ] ]
]
