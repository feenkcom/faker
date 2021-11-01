Class {
	#name : #FakerChoiceSpecification,
	#superclass : #FakerWeightedSpecification,
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerChoiceSpecification >> valueDescriptionOn: aStream [
	aStream 
		<< 'random choice:';
		<< String cr.
	self valuesWithWeightsPercentageOn: aStream
]

{ #category : #'api - generation' }
FakerChoiceSpecification >> valueWith: aFaker [
	^ aFaker
		sample: self values
		withWeights: self weights
]
