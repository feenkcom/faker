Class {
	#name : #FakerSizeSpecification,
	#superclass : #FakerWeightedSpecification,
	#instVars : [
		'variance'
	],
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerSizeSpecification >> descriptionForValue: aValue on: aStream [
	| minValue maxValue minSize |
	minSize := self values min.
	minValue := ((aValue - (aValue * self variance ) asInteger) max: minSize).
	maxValue := aValue + (aValue * self variance ) asInteger.
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

{ #category : #'gt-extensions' }
FakerSizeSpecification >> gtViewValuesWithWeightsFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Values and weights';
		items: [ valuesWithWeights ];
		column: 'Value' text: [ :assoc | assoc key ];
		column: 'Range' text: [ :assoc | 
			String streamContents: [ :aStream |
				self descriptionForValue: assoc key on: aStream ] ];
		column: 'Probabilities' text: [ :assoc | 
			assoc value fakerAsPercentageRelativeTo: self weights sum ];
		column: 'Weight' text: [ :assoc | assoc value ]
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
