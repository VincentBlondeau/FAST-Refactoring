"
A FASTERMultipleSearchWithoutNaming is an example of search by the naming of the search argument.

In this example, we try to find a FASTBehaviouralEntity containing a FASTPharoMessageSend containing a FASTPharoSelector whose name is 'ifTrue:'.

As you didn't specified a name at each find: (by the argument as:), the result will contains only the first
element

See in the test class for the result..

"
Class {
	#name : #FASTERMultipleSearchWithoutNaming,
	#superclass : #FASTERSearch,
	#category : #'FAST-Refactoring-Search-Examples'
}

{ #category : #'transformation - root' }
FASTERMultipleSearchWithoutNaming >> entryPoint [
	self
		find: FASTBehaviouralEntity
		in: self scope
		where: [ :aNode |
			self
				find: FASTPharoMessageSend
				in: aNode
				where: [ :eachSelector | self find: FASTPharoSelector in: eachSelector where: [ :s | s name = 'ifTrue:' ] ] ]
]
