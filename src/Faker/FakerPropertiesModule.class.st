Class {
	#name : #FakerPropertiesModule,
	#superclass : #FakerModule,
	#instVars : [
		'propertiesDictionary',
		'modulesDictionary'
	],
	#category : #'Faker-Properties'
}

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

{ #category : #initialization }
FakerPropertiesModule >> initialize [
	super initialize.
	propertiesDictionary := Dictionary new.
	modulesDictionary := Dictionary new.
]

{ #category : #copying }
FakerPropertiesModule >> postCopy [
	propertiesDictionary := propertiesDictionary copy.
	modulesDictionary := modulesDictionary copy.
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
