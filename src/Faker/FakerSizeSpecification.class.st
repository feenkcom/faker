Class {
	#name : #FakerSizeSpecification,
	#superclass : #FakerWeightedSpecification,
	#instVars : [
		'variance'
	],
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerSizeSpecification >> descriptionForValueAtIndex: anIndex on: aStream [
	| referenceValue minValue maxValue minSize |
	
	minSize := self values min.
	referenceValue := self values at: anIndex.
	minValue := ((referenceValue - (referenceValue * self variance ) asInteger) max: minSize).
	maxValue := referenceValue + (referenceValue * self variance ) asInteger.
	minValue = maxValue ifTrue: [ 
		aStream << minValue asString.
		^ self ].
	aStream
		<< '(';
		<< minValue asString;
		<< ' to ';
		<< maxValue asString;
		<< ')'
]

{ #category : #printing }
FakerSizeSpecification >> valueDescriptionOn: aStream [
	aStream 
		<< 'random value:';
		<< String cr.
	self valuesWithWeightsPercentageOn: aStream.
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
