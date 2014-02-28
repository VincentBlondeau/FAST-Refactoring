"
A FASTERMultipleSearchWithoutNaming is xxxxxxxxx.

"
Class {
	#name : #FASTERMultipleSearchWithNaming,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Search-Examples'
}

{ #category : #'transformation - root' }
FASTERMultipleSearchWithNaming >> entryPoint [
	self
		find: FASTBehaviouralEntity
		as: #FBE
		in: self scope
		where: [ :aNode | 
			self
				find: FASTPharoMessageSend
				as: #FPMS
				in: aNode
				where: [ :eachSelector | 
					self
						find: FASTPharoSelector
						as: #FPS
						in: eachSelector
						where: [ :s | s name = 'ifTrue:' ] ] ]
]
