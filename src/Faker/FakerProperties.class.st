Class {
	#name : 'FakerProperties',
	#superclass : 'FakerModule',
	#instVars : [
		'dictionary'
	],
	#category : 'Faker-Modules'
}

{ #category : 'accessing - basic properties' }
FakerProperties >> at: aSymbol [
	^ self dictionary
		at: aSymbol 
		ifAbsent: [ self error: 'Property must be set before using it' ]
]

{ #category : 'accessing - basic properties' }
FakerProperties >> at: aSymbol ifAbsent: anAbsentBlock [
	^ self dictionary 
		at: aSymbol 
		ifAbsent: anAbsentBlock
]

{ #category : 'accessing - basic properties' }
FakerProperties >> at: aSymbol ifAbsentPut: aValue [
	^ self dictionary 
		at: aSymbol 
		ifAbsentPut: aValue
]

{ #category : 'accessing - basic properties' }
FakerProperties >> at: aSymbol ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self dictionary 
		at: aSymbol 
		ifPresent: aPresentBlock 
		ifAbsent: anAbsentBlock
]

{ #category : 'accessing - basic properties' }
FakerProperties >> at: aSymbol put: aValue [
	^ self dictionary 
		at: aSymbol 
		put: aValue
]

{ #category : 'date' }
FakerProperties >> backwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #backwardDuration 
		ifAbsent: [ nil ]
]

{ #category : 'date' }
FakerProperties >> backwardDuration: aDuration [
	^ self 
		at: #backwardDuration 
		put: aDuration
]

{ #category : 'accessing' }
FakerProperties >> dictionary [
	^ dictionary
]

{ #category : 'accessing' }
FakerProperties >> dictionary: aDictionary [
	self 
		assert: [ aDictionary isNotNil ] 
		description: [ 'Properties dictionary must be non-nil' ].
	dictionary := aDictionary
]

{ #category : 'date' }
FakerProperties >> forwardDuration [
	<return: #Duration or: nil>
	^ self 
		at: #forwardDuration 
		ifAbsent: [ nil ]
]

{ #category : 'date' }
FakerProperties >> forwardDuration: aDuration [
	^ self 
		at: #forwardDuration 
		put: aDuration
]

{ #category : 'date' }
FakerProperties >> fromDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #fromDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : 'date' }
FakerProperties >> fromDateAndTime: aDateAndTime [
	^ self 
		at: #fromDateAndTime 
		put: aDateAndTime
]

{ #category : 'initialization' }
FakerProperties >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : 'date' }
FakerProperties >> isDateRangeDefined [
	<return: #Boolean>
	^ self fromDateAndTime isNotNil or: [ 
		self toDateAndTime isNotNil or: [ 
			self backwardDuration isNotNil or: [ 
				self forwardDuration isNotNil ] ] ]
]

{ #category : 'copying' }
FakerProperties >> postCopy [
	dictionary := dictionary copy
]

{ #category : 'date' }
FakerProperties >> toDateAndTime [
	<return: #DateAndTime or: nil>
	^ self 
		at: #toDateAndTime 
		ifAbsent: [ nil ]
]

{ #category : 'date' }
FakerProperties >> toDateAndTime: aDateAndTime [
	^ self 
		at: #toDateAndTime 
		put: aDateAndTime
]
