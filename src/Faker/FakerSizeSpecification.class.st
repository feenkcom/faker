Class {
	#name : #FakerSizeSpecification,
	#superclass : #FakerValueSpecification,
	#instVars : [
		'sizes',
		'weights',
		'variance'
	],
	#category : #'Faker-Properties'
}

{ #category : #accessing }
FakerSizeSpecification >> sizes [

	^ sizes
]

{ #category : #accessing }
FakerSizeSpecification >> sizes: anObject [

	sizes := anObject
]

{ #category : #accessing }
FakerSizeSpecification >> sizesWithWeights: aCollectionOfValusAndWeights [
	self 
		sizes: aCollectionOfValusAndWeights keys;
		weights: aCollectionOfValusAndWeights values.
]

{ #category : #printing }
FakerSizeSpecification >> valueDescriptionOn: aStream [
	aStream 
		<< 'random weighted value ';
		<< ((1 to: self weights size) collect: [:index |
			'(',
			(self sizes at: index ) asString,
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
		sample: self sizes
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

{ #category : #accessing }
FakerSizeSpecification >> weights [

	^ weights
]

{ #category : #accessing }
FakerSizeSpecification >> weights: anObject [

	weights := anObject
]
