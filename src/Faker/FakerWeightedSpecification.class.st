Class {
	#name : #FakerWeightedSpecification,
	#superclass : #FakerValueSpecification,
	#instVars : [
		'valuesWithWeights'
	],
	#category : #'Faker-Properties'
}

{ #category : #printing }
FakerWeightedSpecification >> descriptionForValue: aValue on: aStream [
	aStream
		<< aValue asString
]

{ #category : #'gt-extensions' }
FakerWeightedSpecification >> gtViewValuesWithWeightsFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Values and weights';
		items: [ valuesWithWeights ];
		column: 'Value' text: [ :assoc | assoc key ];
		column: 'Probabilities' text: [ :assoc | 
			assoc value fakerAsPercentageRelativeTo: self weights sum ];
		column: 'Weight' text: [ :assoc | assoc value ]
]

{ #category : #accessing }
FakerWeightedSpecification >> values [
	^ valuesWithWeights collect: [ :assoc | assoc key ]
]

{ #category : #accessing }
FakerWeightedSpecification >> valuesWithWeights: aDictionaryOfValusAndWeights [
	valuesWithWeights := aDictionaryOfValusAndWeights associations
]

{ #category : #printing }
FakerWeightedSpecification >> valuesWithWeightsPercentageOn: aStream [
	| weightsSum |
	weightsSum := self weights sum.
	valuesWithWeights
		do: [ :assoc |
			self descriptionForValue: assoc key on: aStream.
			aStream
				<< ' - ';
				<< (assoc value fakerAsPercentageRelativeTo: weightsSum)]
		separatedBy: [
			aStream 
				<< ','
				<< String cr ]
]

{ #category : #accessing }
FakerWeightedSpecification >> weights [
	^ valuesWithWeights collect: [ :assoc | assoc value ]
]
