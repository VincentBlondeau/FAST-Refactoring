"
A RBRefactoring is xxxxxxxxx.

Instance Variables
	model:		<Object>
	options:		<Object>

model
	- xxxxx

options
	- xxxxx

"
Class {
	#name : #FASTRBRefactoring,
	#superclass : #Object,
	#instVars : [
		'model',
		'options'
	],
	#classVars : [
		'RefactoringOptions'
	],
	#category : #'FAST-Refactoring-Core-Refactorings'
}

{ #category : #'as yet unclassified' }
FASTRBRefactoring class >> cleanUp [
	"RefactoringOptions holds on to blocks, we should make sure to recreate them so the block references the current method"
	self initializeRefactoringOptions.
]

{ #category : #initialization }
FASTRBRefactoring class >> initialize [
	self initializeRefactoringOptions
]

{ #category : #initialization }
FASTRBRefactoring class >> initializeRefactoringOptions [
	RefactoringOptions := IdentityDictionary new.
	RefactoringOptions
		at: #implementorToInline
		put: [ :ref :imps | self error: #implementorToInline ];
		
		at: #methodName
		put: [ :ref :methodName | self error: #methodName ];
		
		at: #selfArgumentName
		put: [ :ref | self error: #selfArgumentName ];
		
		at: #selectVariableToMoveTo
		put: [ :ref :class :selector | self error: #selectVariableToMoveTo ];	
			
		at: #variableTypes
		put: [ :ref :types :selected | self error: #variableTypes ];
		
		at: #extractAssignment
		put: [ :ref :varName | self error: #extractAssignment ];
		
		at: #inlineExpression
		put: [ :ref :string | self error: #inlineExpression ];
		
		at: #alreadyDefined
		put: [ :ref :cls :selector |  self error: #alreadyDefined ];
		
		at: #useExistingMethod
		put: [ :ref :selector |  self error: #useExistingMethod ];
		
		at: #openBrowser
		put: [ :ref :env |  self error: #openBrowser ]
]

{ #category : #'accessing signal' }
FASTRBRefactoring class >> preconditionSignal [
	^ RBRefactoringError , RBRefactoringWarning
]

{ #category : #accessing }
FASTRBRefactoring class >> refactoringOptions [
	^ RefactoringOptions
]

{ #category : #accessing }
FASTRBRefactoring class >> setDefaultOption: aSymbol to: aBlock [ 
	self refactoringOptions at: aSymbol put: aBlock
]

{ #category : #utilities }
FASTRBRefactoring >> associationForClassVariable: aName in: aClass ifAbsent: aBlock [ 
	self notify: 'In Refactoring-*'.
	^aClass realClass classPool associationAt: aName asSymbol
		ifAbsent: [aClass realClass classPool associationAt: aName asString ifAbsent: aBlock]
]

{ #category : #testing }
FASTRBRefactoring >> canReferenceVariable: aString in: aClass [ 
	self notify: 'In Refactoring-*'.
	(aClass definesVariable: aString) ifTrue: [^true].
	(self model includesGlobal: aString asSymbol) ifTrue: [^true].
	^(self poolVariableNamesFor: aClass) includes: aString
]

{ #category : #accessing }
FASTRBRefactoring >> changes [
	self notify: 'In Refactoring-*'.
	^self model changes
]

{ #category : #support }
FASTRBRefactoring >> checkClass: aRBClass selector: aSelector using: aMatcher [ 
	| parseTree |
		self notify: 'In Refactoring-*'.
	parseTree := aRBClass parseTreeFor: aSelector.
	parseTree notNil ifTrue: [aMatcher executeTree: parseTree].
	^aMatcher answer
]

{ #category : #utilities }
FASTRBRefactoring >> checkInstanceVariableName: aName in: aClass [ 
	self notify: 'In Refactoring-*'.
	^RBCondition checkInstanceVariableName: aName in: aClass
]

{ #category : #utilities }
FASTRBRefactoring >> checkMethodName: aName in: aClass [ 
	self notify: 'In Refactoring-*'.
	^RBCondition checkMethodName: aName in: aClass
]

{ #category : #preconditions }
FASTRBRefactoring >> checkPreconditions [
	| conditions block |
	conditions := self preconditions.
	conditions check 
		ifFalse: 
			[block := conditions errorBlock.
			block notNil 
				ifTrue: [self refactoringError: conditions errorString with: block]
				ifFalse: [self refactoringError: conditions errorString]]
]

{ #category : #private }
FASTRBRefactoring >> classObjectFor: anObject [ 
	self notify: 'In Refactoring-*'.
	(anObject isBehavior or: [anObject isTrait]) ifTrue: [^self model classFor: anObject].
	anObject isSymbol ifTrue: [^self model classNamed: anObject].
	^anObject
]

{ #category : #support }
FASTRBRefactoring >> convertAllReferencesTo: aSymbol using: searchReplacer [ 
	self notify: 'In Refactoring-*'.
	self model allReferencesTo: aSymbol
		do: 
			[:method | 
			self 
				convertMethod: method selector
				for: method modelClass
				using: searchReplacer]
]

{ #category : #support }
FASTRBRefactoring >> convertAllReferencesToClass: aRBClass using: searchReplacer [ 
	self notify: 'In Refactoring-*'.
	self model allReferencesToClass: aRBClass
		do: 
			[:method | 
			self 
				convertMethod: method selector
				for: method modelClass
				using: searchReplacer]
]

{ #category : #support }
FASTRBRefactoring >> convertClasses: classSet select: aBlock using: searchReplacer [ 
	self notify: 'In Refactoring-*'.
	classSet do: 
			[:aClass | 
			(aBlock value: aClass) do: 
					[:selector | 
					self 
						convertMethod: selector
						for: aClass
						using: searchReplacer]]
]

{ #category : #support }
FASTRBRefactoring >> convertMethod: selector for: aClass using: searchReplacer [ 
	"Convert the parse tree for selector using the searchReplacer. If a
	change is made then compile it into the changeBuilder."

	| parseTree |
		self notify: 'In Refactoring-*'.
	parseTree := aClass parseTreeFor: selector.
	parseTree isNil ifTrue: [^self].
	(searchReplacer executeTree: parseTree) 
		ifTrue: [aClass compileTree: searchReplacer tree]
]

{ #category : #accessing }
FASTRBRefactoring >> copyOptionsFrom: aDictionary [ 
	| dict |
		self notify: 'In Refactoring-*'.
	dict := self options.
	dict == self class refactoringOptions 
		ifTrue: [^self options: aDictionary copy].
	dict keysAndValuesDo: 
			[:key :value | 
			value == (self class refactoringOptions at: key) 
				ifTrue: [dict at: key put: (aDictionary at: key)]].
	self options: dict
]

{ #category : #transforming }
FASTRBRefactoring >> defaultEnvironment [
	self notify: 'In Refactoring-*'.
	^RBBrowserEnvironment new
]

{ #category : #transforming }
FASTRBRefactoring >> execute [
	self notify: 'In Refactoring-*'.
	self primitiveExecute.
	RBRefactoringManager instance addRefactoring: self
]

{ #category : #transforming }
FASTRBRefactoring >> model [
	^model isNil 
		ifTrue: 
			[model := (RBNamespace onEnvironment: self defaultEnvironment)
						name: self printString;
						yourself]
		ifFalse: [model]
]

{ #category : #'initialize-release' }
FASTRBRefactoring >> model: aRBNamespace [ 
	model := aRBNamespace
]

{ #category : #private }
FASTRBRefactoring >> onError: aBlock do: errorBlock [ 
	^aBlock on: self class preconditionSignal
		do: 
			[:ex | 
			errorBlock value.
			ex return: nil]
]

{ #category : #requests }
FASTRBRefactoring >> openBrowserOn: anEnvironment [ 
	^(self options at: #openBrowser) value: self value: anEnvironment
]

{ #category : #accessing }
FASTRBRefactoring >> options [
	^options isNil ifTrue: [self class refactoringOptions] ifFalse: [options]
]

{ #category : #accessing }
FASTRBRefactoring >> options: aDictionary [ 
	options := aDictionary
]

{ #category : #transforming }
FASTRBRefactoring >> performComponentRefactoring: aRefactoring [ 
	aRefactoring copyOptionsFrom: self options.
	aRefactoring primitiveExecute
]

{ #category : #utilities }
FASTRBRefactoring >> poolVariableNamesFor: aClass [ 
	| pools |
	pools := Set new.
	aClass withAllSuperclasses do: 
			[:each | 
			each allPoolDictionaryNames do: 
					[:pool | 
					pools addAll: ((Smalltalk globals at: pool asSymbol) keys 
								collect: [:name | name asString])]].
	^pools
]

{ #category : #preconditions }
FASTRBRefactoring >> preconditions [
	self subclassResponsibility
]

{ #category : #private }
FASTRBRefactoring >> primitiveExecute [
	self checkPreconditions.
	self transform
]

{ #category : #private }
FASTRBRefactoring >> refactoringError: aString [ 
	^ RBRefactoringError signal: aString
]

{ #category : #private }
FASTRBRefactoring >> refactoringError: aString with: aBlock [ 
	^ RBRefactoringError signal: aString with: aBlock
]

{ #category : #private }
FASTRBRefactoring >> refactoringFailure: aString [ 
	^ RBRefactoringFailure signal: aString
]

{ #category : #private }
FASTRBRefactoring >> refactoringFailure: aString with: aBlock [
	^ RBRefactoringFailure signal: aString with: aBlock
]

{ #category : #private }
FASTRBRefactoring >> refactoringWarning: aString [ 
	^ RBRefactoringWarning signal: aString
]

{ #category : #requests }
FASTRBRefactoring >> requestImplementorToInline: implementorsCollection [ 
	^(self options at: #implementorToInline) value: self
		value: implementorsCollection
]

{ #category : #requests }
FASTRBRefactoring >> requestMethodNameFor: aMethodName [ 
	^(self options at: #methodName) value: self value: aMethodName
]

{ #category : #requests }
FASTRBRefactoring >> requestSelfArgumentName [
	^(self options at: #selfArgumentName) value: self
]

{ #category : #utilities }
FASTRBRefactoring >> safeMethodNameFor: aClass basedOn: aString [ 
	"Creates an unused method name containing aString"

	| baseString newString hasParam i |
	baseString := aString copy.
	baseString at: 1 put: baseString first asLowercase.
	newString := baseString.
	hasParam := newString last = $:.
	hasParam 
		ifTrue: [baseString := newString copyFrom: 1 to: newString size - 1].
	i := 0.
	[aClass hierarchyDefinesMethod: newString asSymbol] whileTrue: 
			[i := i + 1.
			newString := baseString , i printString 
						, (hasParam ifTrue: [':'] ifFalse: [''])].
	^newString asSymbol
]

{ #category : #private }
FASTRBRefactoring >> safeVariableNameFor: aClass temporaries: allTempVars basedOn: aString [
	| baseString i newString |
	newString := baseString := aString.
	i := 0.
	[ (allTempVars includes: newString) or: [ aClass definesInstanceVariable: newString ] ] 
		whileTrue: [ 
			i := i + 1.
			newString := baseString , i printString ].
	^ newString
]

{ #category : #requests }
FASTRBRefactoring >> selectVariableToMoveMethodTo: aSelector class: aClass [ 
	^(self options at: #selectVariableToMoveTo) 
		value: self
		value: aClass
		value: aSelector
]

{ #category : #requests }
FASTRBRefactoring >> selectVariableTypesFrom: initialTypeCollection selected: selectedTypeCollection [ 
	^ (self options at: #variableTypes) 
		value: self
		value: initialTypeCollection
		value: selectedTypeCollection

]

{ #category : #accessing }
FASTRBRefactoring >> setOption: aSymbol toUse: aBlock [ 
	| dict |
	dict := self options.
	dict == self class refactoringOptions ifTrue: [dict := dict copy].
	dict at: aSymbol put: aBlock.
	self options: dict
]

{ #category : #requests }
FASTRBRefactoring >> shouldExtractAssignmentTo: aString [ 
	^(self options at: #extractAssignment) value: self value: aString
]

{ #category : #requests }
FASTRBRefactoring >> shouldInlineExpression: aString [ 
	^(self options at: #inlineExpression) value: self value: aString
]

{ #category : #requests }
FASTRBRefactoring >> shouldOverride: aSelector in: aClass [ 
	^(self options at: #alreadyDefined) 
		value: self
		value: aClass
		value: aSelector
]

{ #category : #requests }
FASTRBRefactoring >> shouldUseExistingMethod: aSelector [ 
	^(self options at: #useExistingMethod) value: self value: aSelector
]

{ #category : #transforming }
FASTRBRefactoring >> transform [
	self subclassResponsibility
]

{ #category : #private }
FASTRBRefactoring >> uniqueMethodNameFor: anInteger [ 
	| before after index name |
	before := 'a'.
	after := ''.
	anInteger timesRepeat: [after := after , 'z:'].
	index := 0.
	
	[name := before , index printString , after.
	(Symbol findInterned: name) notNil] 
			whileTrue: [index := index + 1].
	^name asSymbol
]

{ #category : #utilities }
FASTRBRefactoring >> whichVariableNode: aParseTree inInterval: anInterval name: aName [ 
	| matcher block |
		self notify: 'In Refactoring-*'.
	matcher := RBParseTreeSearcher new.
	block := 
			[:aNode :answer | 
			(aNode intersectsInterval: anInterval) ifTrue: [aNode] ifFalse: [answer]].
	matcher
		matches: aName do: block;
		matchesArgument: aName do: block.
	^matcher executeTree: aParseTree initialAnswer: nil
]
