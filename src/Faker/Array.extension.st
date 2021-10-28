Extension { #name : #Array }

{ #category : #'*Faker' }
Array >> fakerWeightedChoice [
	^ FakerChoiceSpecification new
		valuesWithWeights: self asOrderedDictionary
]

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance [
	^ self fakerWeightedSizeWithVariance: 20 percent
]

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance: aPercent [
	^ FakerSizeSpecification new
		valuesWithWeights: self asOrderedDictionary; 
		variance: aPercent
]
