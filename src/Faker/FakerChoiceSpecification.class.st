Class {
	#name : #FakerChoiceSpecification,
	#superclass : #FakerWeightedSpecification,
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerChoiceSpecification >> valueDescriptionOn: aStream [
	aStream 
		<< 'random weighted choice ';
		<< ((1 to: self weights size) collect: [:index |
			'(',
			(self values at: index ) asString,
			', ', 
			(self weights at: index ) asString,
			')']) asCommaString
]

{ #category : #'api - generation' }
FakerChoiceSpecification >> valueWith: aFaker [
	^ aFaker
		sample: self values
		withWeights: self weights
]
