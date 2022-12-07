Trait {
	#name : #TFakerAddressLocaleModule,
	#category : #'Faker-Locales'
}

{ #category : #address }
TFakerAddressLocaleModule >> composedStreetName [
	| streetName |

	streetName := (self base sampleWithWeights: {true -> 70 . false -> 30} asOrderedDictionary)
		ifTrue: [ self sample: self composedStreetNamePrefixes  ]
		ifFalse: [
			self sample: {
				self locales nameModule personFirstName .
				self locales nameModule personLastName
			}
		].
	
	^ '{1}{2}' format: {streetName . self sample: self composedStreetNameSuffixes}
]

{ #category : #address }
TFakerAddressLocaleModule >> simpleStreetName [
	| nameModule |

	nameModule :=  self locales nameModule.
	
	^ ' ' join: {nameModule personFirstName . nameModule personLastName . self streetType}.
]

{ #category : #address }
TFakerAddressLocaleModule >> streetName [
	(self base sampleWithWeights: self simpleToComposedStreetNamesRatio) 
		ifTrue: [ ^ self simpleStreetName ]
		ifFalse: [ ^ self composedStreetName ].
]

{ #category : #address }
TFakerAddressLocaleModule >> streetNumber [
	^ self base nextIntegerBetween: 1 and: 100.
]

{ #category : #address }
TFakerAddressLocaleModule >> streetType [
	^ self sample: self streetTypes
]
