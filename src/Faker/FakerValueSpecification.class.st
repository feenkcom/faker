Class {
	#name : #FakerValueSpecification,
	#superclass : #Object,
	#category : #'Faker-Properties'
}

{ #category : #'api - generation' }
FakerValueSpecification >> fakerValueWith: aFaker [
	^ self valueWith: aFaker
]

{ #category : #accessing }
FakerValueSpecification >> valueDescription [
	^ String streamContents: [ :aStream |
		self valueDescriptionOn: aStream ]
]

{ #category : #printing }
FakerValueSpecification >> valueDescriptionOn: aStream [
	self subclassResponsibility
]

{ #category : #'api - generation' }
FakerValueSpecification >> valueWith: aFaker [
	self subclassResponsibility  
]
