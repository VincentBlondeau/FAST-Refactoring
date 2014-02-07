"
A FASTERTransformationDirectionNotProperlySet is an exception risen when the direction kind of the transformation is not well set.

2 values are possibles : 
#in : read-only : the FAST AST referenced by this is not modifiable
#inout : read / write :  the FAST AST referenced by this is  modifiable
"
Class {
	#name : #FASTERTransformationDirectionNotProperlySet,
	#superclass : #FASTERException,
	#category : #'FAST-Refactoring-Exceptions'
}
