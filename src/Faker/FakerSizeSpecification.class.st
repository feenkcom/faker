Class {
	#name : #FakerSizeSpecification,
	#superclass : #FakerWeightedSpecification,
	#instVars : [
		'variance'
	],
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerSizeSpecification >> valueDescriptionOn: aStream [
	aStream 
		<< 'random weighted value ';
		<< ((1 to: self weights size) collect: [:index |
			'(',
			(self values at: index ) asString,
			', ', 
			(self weights at: index ) asString,
			')']) asCommaString;
		<< ' ± ';
		<< self variance asString;
		<< '%'
]

{ #category : #'api - generation' }
FakerSizeSpecification >> valueWith: aFaker [
	^ aFaker sizeGenerator
		sample: self values
		withWeights: self weights
		andVariance: self variance
]

{ #category : #accessing }
FakerSizeSpecification >> variance [

	^ variance
]

{ #category : #accessing }
FakerSizeSpecification >> variance: anObject [

	variance := anObject
]
