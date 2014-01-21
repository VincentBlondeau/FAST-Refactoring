Extension { #name : #Collection }

{ #category : #'*FAST-Refactoring-Core' }
Collection >> --> aTransformationMethodName [
	self do: [ :each | | transform |
		transform := FASTERTransformIfBlockInJava new this: each; yourself.
		transform perform: aTransformationMethodName 
	]
	
]
