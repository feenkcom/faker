Class {
	#name : #FakerWeightedSpecification,
	#superclass : #FakerValueSpecification,
	#instVars : [
		'values',
		'weights'
	],
	#category : #'Faker-Properties'
}

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

{ #category : #accessing }
FakerWeightedSpecification >> weights [

	^ weights
]

{ #category : #accessing }
FakerWeightedSpecification >> weights: anObject [

	weights := anObject
]
