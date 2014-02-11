Extension { #name : #Collection }

{ #category : #'*FAST-Refactoring-Core' }
Collection >> --> aTransformationMethodName [
	^ self collect: [ :each | | transform |
		transform := (aTransformationMethodName perform: #new) inNode: each; yourself.
		transform apply
	]
	
]
