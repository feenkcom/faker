Class {
	#name : #FakerInBetweenIntegerSpecification,
	#superclass : #FakerValueSpecification,
	#instVars : [
		'lowerBound',
		'higherBound',
		'useScale'
	],
	#category : #'Faker-Properties'
}

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> higherBound [

	^ higherBound
]

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> higherBound: anObject [

	higherBound := anObject
]

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> lowerBound [

	^ lowerBound
]

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> lowerBound: anObject [

	lowerBound := anObject
]

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> useScale [

	^ useScale
]

{ #category : #accessing }
FakerInBetweenIntegerSpecification >> useScale: anObject [

	useScale := anObject
]

{ #category : #'api - generation' }
FakerInBetweenIntegerSpecification >> valueWith: aFaker [
	^ aFaker 
		nextScaledIntegerBetween: self lowerBound 
		and: self higherBound
]
