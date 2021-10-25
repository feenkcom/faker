Class {
	#name : #FakerPropertiesModule,
	#superclass : #FakerModule,
	#instVars : [
		'propertiesDictionary',
		'modulesDictionary'
	],
	#category : #'Faker-Properties'
}

{ #category : #accessing }
FakerPropertiesModule >> allProperties [ 
	| allProperties |
	allProperties := OrderedDictionary new.
	self withAllModulesDo: [ :aModule |
		allProperties addAll: aModule propertiesDictionary associations ].
	^ allProperties
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol [
	^ self propertiesDictionary
		at: aSymbol 
		ifAbsent: [ self error: 'Property must be set before using it' ]
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifAbsent: anAbsentBlock [
	^ self propertiesDictionary 
		at: aSymbol 
		ifAbsent: anAbsentBlock
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifAbsentPut: aValue [
	^ self propertiesDictionary 
		at: aSymbol 
		ifAbsentPut: aValue
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self propertiesDictionary 
		at: aSymbol 
		ifPresent: aPresentBlock 
		ifAbsent: anAbsentBlock
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol put: aValue [
	^ self propertiesDictionary 
		at: aSymbol 
		put: aValue
]

{ #category : #accessing }
FakerPropertiesModule >> base: aFaker [
	super base: aFaker.
	self propertyModules do: [ :aPropertiesModule |
		aPropertiesModule base: aFaker ]
]

{ #category : #'gt-extensions' }
FakerPropertiesModule >> gtViewAllPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'All Properties';
		priority: 5;
		items: [ self allProperties associations ];
		column: 'Property' text: [ :assoc | 
			assoc key capitalized splitCamelCase asStringWithCr ];
		column: 'Value' text: [ :assoc | 
			(assoc value isKindOf: FakerValueSpecification)
				ifTrue: [ assoc value valueDescription ]
				ifFalse: [ assoc value  gtDisplayString ] ];
		send: [ :assoc | assoc value ]
]

{ #category : #'gt-extensions' }
FakerPropertiesModule >> gtViewCurrentPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Current Properties';
		priority: 10;
		items: [ propertiesDictionary associations ];
		column: 'Property' text: [ :assoc |
			assoc key capitalized splitCamelCase asStringWithCr ];
		column: 'Value' text: [ :assoc | 
			(assoc value isKindOf: FakerValueSpecification)
				ifTrue: [ assoc value valueDescription ]
				ifFalse: [ assoc value  gtDisplayString ] ];
		send: [ :assoc | assoc value ]
]

{ #category : #'gt-extensions' }
FakerPropertiesModule >> gtViewModulesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Modules';
		items: [ modulesDictionary associations ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Properties' text: [ :assoc | assoc value propertiesCount ];
		column: 'Modules' text: [ :assoc | assoc value modulesCount ];
		send: [ :assoc | assoc value ]
]

{ #category : #initialization }
FakerPropertiesModule >> initialize [
	super initialize.
	propertiesDictionary := OrderedDictionary new.
	modulesDictionary := OrderedDictionary new.
]

{ #category : #accessing }
FakerPropertiesModule >> modulesCount [
	^ modulesDictionary size
]

{ #category : #copying }
FakerPropertiesModule >> postCopy [
	propertiesDictionary := propertiesDictionary copy.
	modulesDictionary := modulesDictionary copy.
]

{ #category : #accessing }
FakerPropertiesModule >> propertiesCount [
	^ propertiesDictionary size
]

{ #category : #accessing }
FakerPropertiesModule >> propertiesDictionary [
	^ propertiesDictionary
]

{ #category : #accessing }
FakerPropertiesModule >> propertiesDictionary: aDictionary [
	self 
		assert: [ aDictionary isNotNil ] 
		description: [ 'Properties dictionary must be non-nil' ].
	propertiesDictionary := aDictionary
]

{ #category : #accessing }
FakerPropertiesModule >> propertyModules [
	^ modulesDictionary values
]

{ #category : #utils }
FakerPropertiesModule >> valueFor: aProperty withDefault: aDefaultBlock [
	^ self 
		at: aProperty 
		ifPresent: [ :aSpecification |
			aSpecification fakerValueWith: self base ]
		ifAbsent: aDefaultBlock
]

{ #category : #enumerating }
FakerPropertiesModule >> withAllModulesDo: aBlock [
	aBlock value: self.
	modulesDictionary valuesDo: [ :aModule |
		aModule withAllModulesDo: aBlock ]
]