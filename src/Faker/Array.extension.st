Extension { #name : #Array }

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance [
	^ self fakerWeightedSizeWithVariance: 20 percent
]

{ #category : #'*Faker' }
Array >> fakerWeightedSizeWithVariance: aPercent [
	^ FakerSizeSpecification new
		sizesWithWeights: self asOrderedDictionary; 
		variance: aPercent
]
