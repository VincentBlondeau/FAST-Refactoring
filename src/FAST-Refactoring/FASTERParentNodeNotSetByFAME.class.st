"
A FASTERParentNodeNotSetWithFAMEAnnotations is an exception risen when the Parent Node of a FAST Object is not set.
But Parent Node has to be set by annotations on FAST methods.

This exception means that the FAME model via annotaions is not well used.

You can resolve this by adding some MSEProperty:type:opposite:  or  transform the IV containing OrderedCollections in FMMultivalueLinks.


=============================
 change superclass   because warning is just intermediate and it should be an error

"
Class {
	#name : #FASTERParentNodeNotSetByFAME,
	#superclass : #FASTERException,
	#category : #'FAST-Refactoring-Exceptions'
}
