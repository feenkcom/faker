Class {
	#name : #FakerWeightedSpecification,
	#superclass : #FakerValueSpecification,
	#instVars : [
		'values',
		'weights'
	],
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerWeightedSpecification >> descriptionForValueAtIndex: anIndex on: aStream [
	aStream
		<< (self values at: anIndex) asString
]

{ #category : #accessing }
FakerWeightedSpecification >> values [

	^ values
]

{ #category : #accessing }
FakerWeightedSpecification >> values: anObject [

	values := anObject
]

{ #category : #accessing }
FakerWeightedSpecification >> valuesWithWeights: aCollectionOfValusAndWeights [
	self 
		values: aCollectionOfValusAndWeights keys;
		weights: aCollectionOfValusAndWeights values.
]

{ #category : #printing }
FakerWeightedSpecification >> valuesWithWeightsPercentageOn: aStream [
	| weightsSum |
	weightsSum := self weights sum.
	(1 to: self weights size) 
		do: [:index |
			self descriptionForValueAtIndex: index on: aStream.
			aStream
				<< ' - ';
				<< ((self weights at: index) soAsPrcentageRelativeTo: weightsSum)]
		separatedBy: [
			aStream 
				<< ','
				<< String cr ]
]

{ #category : #accessing }
FakerWeightedSpecification >> weights [

	^ weights
]

{ #category : #accessing }
FakerWeightedSpecification >> weights: anObject [

	weights := anObject
]
