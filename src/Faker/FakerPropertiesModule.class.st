Class {
	#name : #FakerPropertiesModule,
	#superclass : #FakerModule,
	#instVars : [
		'dictionary'
	],
	#category : #'Faker-Properties'
}

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol [
	^ self dictionary
		at: aSymbol 
		ifAbsent: [ self error: 'Property must be set before using it' ]
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifAbsent: anAbsentBlock [
	^ self dictionary 
		at: aSymbol 
		ifAbsent: anAbsentBlock
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifAbsentPut: aValue [
	^ self dictionary 
		at: aSymbol 
		ifAbsentPut: aValue
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self dictionary 
		at: aSymbol 
		ifPresent: aPresentBlock 
		ifAbsent: anAbsentBlock
]

{ #category : #'accessing - basic properties' }
FakerPropertiesModule >> at: aSymbol put: aValue [
	^ self dictionary 
		at: aSymbol 
		put: aValue
]

{ #category : #accessing }
FakerPropertiesModule >> dictionary [
	^ dictionary
]

{ #category : #accessing }
FakerPropertiesModule >> dictionary: aDictionary [
	self 
		assert: [ aDictionary isNotNil ] 
		description: [ 'Properties dictionary must be non-nil' ].
	dictionary := aDictionary
]

{ #category : #initialization }
FakerPropertiesModule >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #copying }
FakerPropertiesModule >> postCopy [
	dictionary := dictionary copy
]
