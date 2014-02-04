Extension { #name : #Collection }

{ #category : #'*FAST-Refactoring-Core' }
Collection >> --> aTransformationMethodName [
	^ self collect: [ :each | | transform |
		transform := (aTransformationMethodName asClass perform: #new) this: each; yourself.
		transform apply
	]
	
]
