Class {
	#name : #FakerValueSpecification,
	#superclass : #Object,
	#category : #'Faker-Properties'
}

{ #category : #'api - generation' }
FakerValueSpecification >> fakerValueWith: aFaker [
	^ self valueWith: aFaker
]

{ #category : #'api - generation' }
FakerValueSpecification >> valueWith: aFaker [
	self subclassResponsibility  
]
