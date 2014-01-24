Extension { #name : #Collection }

{ #category : #'*FAST-Refactoring-Core' }
Collection >> --> aTransformationMethodName [
	self do: [ :each | | transform |
		transform := (aTransformationMethodName asClass perform: #new) this: each; yourself.
		transform apply
	]
	
]
