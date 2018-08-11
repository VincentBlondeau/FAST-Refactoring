Class {
	#name : #ConfigurationOfFASTRefactoring,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #ConfigurationOfFASTRefactoring
}

{ #category : #'development support' }
ConfigurationOfFASTRefactoring class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfFASTRefactoring class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfFASTRefactoring class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfFASTRefactoring class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfFASTRefactoring class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfFASTRefactoring class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfFASTRefactoring class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfFASTRefactoring class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfFASTRefactoring class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfFASTRefactoring class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfFASTRefactoring >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/VincentBlondeau/FAST-Refactoring/main/'.
		spec 
			project: 'FASTJava' with: [
				spec
					className: 'ConfigurationOfFASTJava';
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTJava/main/' ];
			project: 'FASTPharo' with: [
				spec
					className: 'ConfigurationOfFASTPharo';
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTPharo/main/' ].
		spec 
			package: 'FAST-Refactoring-Tests-Data';
			package: 'FAST-Displaying';
			package: 'FAST-Refactoring' with: [
				spec requires: #('FAST-Refactoring-Tests-Data' 'FAST-Displaying' ). ].
		spec group: 'Main' with: #('FAST-Refactoring-Tests-Data' 'FAST-Displaying' 'FAST-Refactoring' ). ].

]

{ #category : #baselines }
ConfigurationOfFASTRefactoring >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/VincentBlondeau/FAST-Refactoring/main/'.
		spec 
			project: 'FASTJava' with: [
				spec
					className: #ConfigurationOfFASTJava;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTJava/main/' ];
			project: 'FASTPharo' with: [
				spec
					className: #ConfigurationOfFASTPharo;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTPharo/main/' ].
		spec 
			package: 'FAST-Refactoring-Tests-Data';
			package: 'FAST-Displaying';
			package: 'FAST-Refactoring' with: [
				spec requires: #('FAST-Displaying' ). ];
			package: 'FAST-Refactoring-Tests' with: [
				spec requires: #('FAST-Refactoring-Tests-Data' 'FAST-Refactoring' ). ].
		spec group: 'Main' with: #('FAST-Refactoring-Tests-Data' 'FAST-Displaying' 'FAST-Refactoring' 'FAST-Refactoring-Tests' ). ].

]

{ #category : #baselines }
ConfigurationOfFASTRefactoring >> baseline03: spec [
	<version: '0.3-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/VincentBlondeau/FAST-Refactoring/main/'.
			spec
				project: 'FASTJava'
					with: [ 
							spec
								className: #ConfigurationOfFASTJava;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/FASTJava/main/' ];
				project: 'FASTPharo'
					with: [ 
							spec
								className: #ConfigurationOfFASTPharo;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/FASTPharo/main/' ].
			spec
				package: 'FAST-Refactoring-Tests-Data';
				package: 'FAST-Displaying';
				package: 'FAST-Refactoring' with: [ spec requires: #('FAST-Displaying') ];
				package: 'FAST-Refactoring-Tests'
					with: [ spec requires: #('FAST-Refactoring-Tests-Data' 'FAST-Refactoring' 'FASTJava' 'FASTPharo') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('FAST-Displaying' 'FAST-Refactoring');
				group: 'Tests' with: #('FAST-Refactoring-Tests' 'FAST-Refactoring-Tests-Data') ]
]

{ #category : #baselines }
ConfigurationOfFASTRefactoring >> baseline04: spec [
	<version: '0.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/VincentBlondeau/FAST-Refactoring/main/'.
		spec 
			project: 'FASTJava' with: [
				spec
					className: #ConfigurationOfFASTJava;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTJava/main/' ];
			project: 'FASTPharo' with: [
				spec
					className: #ConfigurationOfFASTPharo;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTPharo/main/' ];
			project: 'FASTCore' with: [
				spec
					className: #ConfigurationOfFASTCore;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main/' ].
		spec 
			package: 'FAST-Refactoring-Tests-Data';
			package: 'FAST-Displaying';
			package: 'FAST-Refactoring' with: [
				spec requires: #('FAST-Displaying' 'FASTCore' ). ];
			package: 'FAST-Refactoring-Tests' with: [
				spec requires: #('FAST-Refactoring-Tests-Data' 'FAST-Refactoring' 'FASTJava' 'FASTPharo' ). ].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('FAST-Displaying' 'FAST-Refactoring' );
			group: 'Tests' with: #('FAST-Refactoring-Tests' 'FAST-Refactoring-Tests-Data' ). ].

]

{ #category : #accessing }
ConfigurationOfFASTRefactoring >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().  
]

{ #category : #'symbolic versions' }
ConfigurationOfFASTRefactoring >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.4-baseline'.

]

{ #category : #accessing }
ConfigurationOfFASTRefactoring >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfFASTRefactoring >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.3'.

]

{ #category : #versions }
ConfigurationOfFASTRefactoring >> version01: spec [
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1'.
		spec author: 'VincentBlondeau'.
		spec timestamp: '2/18/2014 16:23'.
		spec 
			project: 'FASTJava' with: #'stable';
			project: 'FASTPharo' with: #'stable'.
		spec 
			package: 'FAST-Refactoring-Tests-Data' with: 'FAST-Refactoring-Tests-Data-VincentBlondeau.7';
			package: 'FAST-Displaying' with: 'FAST-Displaying-VincentBlondeau.10';
			package: 'FAST-Refactoring' with: 'FAST-Refactoring-VincentBlondeau.26'. ].

]

{ #category : #versions }
ConfigurationOfFASTRefactoring >> version02: spec [
	<version: '0.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.2'.
		spec author: 'VincentBlondeau'.
		spec timestamp: '3/18/2014 11:05'.
		spec 
			project: 'FASTJava' with: #'stable';
			project: 'FASTPharo' with: #'stable'.
		spec 
			package: 'FAST-Refactoring-Tests-Data' with: 'FAST-Refactoring-Tests-Data-VincentBlondeau.10';
			package: 'FAST-Displaying' with: 'FAST-Displaying-VincentBlondeau.13';
			package: 'FAST-Refactoring' with: 'FAST-Refactoring-VincentBlondeau.37';
			package: 'FAST-Refactoring-Tests' with: 'FAST-Refactoring-Tests-VincentBlondeau.8'. ].

]

{ #category : #versions }
ConfigurationOfFASTRefactoring >> version03: spec [
	<version: '0.3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3'.
		spec author: 'VincentBlondeau'.
		spec timestamp: '8/17/2015 15:37'.
		spec 
			project: 'FASTJava' with: '1.0-baseline';
			project: 'FASTPharo' with: '1.0-baseline'.
		spec 
			package: 'FAST-Refactoring-Tests-Data' with: 'FAST-Refactoring-Tests-Data-VincentBlondeau.10';
			package: 'FAST-Displaying' with: 'FAST-Displaying-VincentBlondeau.14';
			package: 'FAST-Refactoring' with: 'FAST-Refactoring-VincentBlondeau.38';
			package: 'FAST-Refactoring-Tests' with: 'FAST-Refactoring-Tests-VincentBlondeau.9'. ].

]

{ #category : #versions }
ConfigurationOfFASTRefactoring >> version04: spec [
	<version: '0.4' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4 - Valid with Moose 6.1'.
		spec author: 'CYrilFerlicot'.
		spec timestamp: '3/13/2017 11:37'.
		spec 
			project: 'FASTJava' with: '1.0-baseline';
			project: 'FASTPharo' with: '1.0-baseline';
			project: 'FASTCore' with: '0.5'.
		spec 
			package: 'FAST-Refactoring-Tests-Data' with: 'FAST-Refactoring-Tests-Data-VincentBlondeau.10';
			package: 'FAST-Displaying' with: 'FAST-Displaying-VincentBlondeau.14';
			package: 'FAST-Refactoring' with: 'FAST-Refactoring-CyrilFerlicot.40';
			package: 'FAST-Refactoring-Tests' with: 'FAST-Refactoring-Tests-VincentBlondeau.9'. ].

]
