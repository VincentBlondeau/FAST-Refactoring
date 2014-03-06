"
A FASTERMultipleSearchWithNaming is an example of search by naming the search argument.

In this example, we try to find a FASTBehaviouralEntity containing a FASTPharoMessageSend containing a FASTPharoSelector whose name is 'ifTrue:'.

As you specified a name at each find: (by the argument as:), the result will contains all the elements where the 
name is specified.

See in the test class for the result.
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
