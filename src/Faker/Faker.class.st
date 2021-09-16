Class {
	#name : 'Faker',
	#superclass : 'Object',
	#instVars : [
		'locales',
		'random',
		'properties'
	],
	#classVars : [
		'Letters',
		'Numbers',
		'ULetters'
	],
	#category : 'Faker-Core'
}

{ #category : 'class initialization' }
Faker class >> initialize [
	Numbers := 0 to: 9.
	ULetters := Character alphabet.
   Letters := ULetters, ULetters asUppercase.
]

{ #category : 'accessing - modules' }
Faker >> char [
	^ FakerChar uniqueInstance
]

{ #category : 'accessing - modules' }
Faker >> company [
	^ FakerCompany new base: self
]

{ #category : 'accessing - modules' }
Faker >> country [
	^ FakerCountry new base: self
]

{ #category : 'accessing - modules' }
Faker >> date [
	^ FakerDate new base: self
]

{ #category : 'defaults' }
Faker >> defaultLocales [
	^ FakerLocales default
]

{ #category : 'defaults' }
Faker >> defaultRandom [
	^ SharedRandom globalGenerator
]

{ #category : 'actions' }
Faker >> firstName [
	<return: #String>
	^ self name firstName
]

{ #category : 'accessing - modules' }
Faker >> internet [
	^ FakerInternet new base: self
]

{ #category : 'actions' }
Faker >> lastName [
	<return: #String>
	^ self name lastName
]

{ #category : 'actions' }
Faker >> letters: aSize [
	| availableChars |
	availableChars := Character alphabet.
	^ String streamContents: [ :aStream |
		aStream nextPutAll: (self 
			sample: availableChars 
			ofSize: aSize) ] 
]

{ #category : 'accessing' }
Faker >> locales [
	<return: #FakerLocales>
	^ locales ifNil: [ locales := FakerLocales default base: self ]
]

{ #category : 'accessing' }
Faker >> locales: aFakerLocales [
	self 
		assert: [ aFakerLocales isNotNil ] 
		description: [ 'Locales must be non-nil' ].
	locales := aFakerLocales
]

{ #category : 'accessing - modules' }
Faker >> name [
	^ FakerName new base: self
]

{ #category : 'actions' }
Faker >> numerify: aNumberPattern [
	"Replace # characters by numbers."
	<return: #String>
	^ self numerify: aNumberPattern leadingZero: false
]

{ #category : 'actions' }
Faker >> numerify: aNumberPattern leadingZero: aBoolean [
	"Replace # characters by numbers. 
	 Initial number can be a zero if aBoolean is true"
	<return: #String>
	| aResult aFirstIteration |
	self 
		assert: [ aNumberPattern isString ]
		description: [ 'Number pattern must be a string' ].
	self 
		assert: [ aBoolean isNotNil ]
		description: [ 'Leading zero must be a boolean' ].
	aFirstIteration := true.
	aResult := aNumberPattern collect: [ :eachCharacter | 
		(eachCharacter = $#) 
			ifTrue: [ 
				(aFirstIteration and: aBoolean)
					ifTrue: [ 
						aFirstIteration := false.
						(0 to: 9) atRandom asCharacterDigit ] 
					ifFalse: [ 
						aFirstIteration := false.
						(1 to: 9) atRandom asCharacterDigit ] ]
			ifFalse: [ eachCharacter ] ].
	self assert: [ aResult isString ].
	self assert: [ (aResult includesSubstring: '#') not ].
	^ aResult
]

{ #category : 'actions' }
Faker >> prepareString: aString [ 
	<return: #String>
	^ self char prepare: aString
]

{ #category : 'accessing' }
Faker >> properties [
	<return: #FakerProperties>
	^ properties ifNil: [ properties := FakerProperties new base: self ]
]

{ #category : 'accessing' }
Faker >> properties: aFakerProperties [
	self 
		assert: [ aFakerProperties isNotNil ] 
		description: [ 'Faker properties must be non-nil' ].
	properties := aFakerProperties
]

{ #category : 'accessing' }
Faker >> random [
	<return: #Random>
	^ random ifNil: [ random := self defaultRandom ]
]

{ #category : 'accessing' }
Faker >> random: aRandom [
	self 
		assert: [ aRandom isNotNil ] 
		description: [ 'Random instance must be non-nil' ].
	random := aRandom
]

{ #category : 'actions' }
Faker >> sample: aCollection [
	"Return any random item from the collection"
	<return: #Object>
	self 
		assert: [ aCollection isNotNil ]
		description: [ 'Only collections can be sampled' ].
	^ aCollection atRandom: self random.
]

{ #category : 'actions' }
Faker >> sample: aCollection ofSize: aSize [
	"Return a given numer of items from the collection.
	Each value can be sampled multiple times."
	<return: #Object>
	self 
		assert: [ aCollection isNotNil ]
		description: [ 'Only collections can be sampled' ].
	^ aSize timesCollect: [
		self sample: aCollection ]
]

{ #category : 'actions' }
Faker >> sample: aCollection ofSize: aSize withCumulativeWeights: aCollectionOfCumulativeWeights [
	^ aSize timesCollect: [ 
		self 
			sample: aCollection 
			withCumulativeWeights: aCollectionOfCumulativeWeights ]
]

{ #category : 'actions' }
Faker >> sample: aCollection ofSize: aSize withWeights: aCollectionOfWeights [
	| cumulativeWeights currentSum |
	<return: #Object>
	cumulativeWeights := Array new: aCollectionOfWeights size.
	currentSum := 0.
	aCollectionOfWeights withIndexDo: [ :aWeight :anIndex | 
		currentSum := currentSum + aWeight.
		cumulativeWeights at: anIndex put: currentSum ].
	^ self 
		sample: aCollection 
		ofSize: aSize
		withCumulativeWeights: cumulativeWeights
]

{ #category : 'actions' }
Faker >> sample: aCollection withCumulativeWeights: aCollectionOfCumulativeWeights [
	| totalWeight randomValue |
	
	totalWeight := aCollectionOfCumulativeWeights last.
	randomValue := self random nextInteger: totalWeight.
	aCollectionOfCumulativeWeights withIndexDo: [ :aWeight :index |
		aWeight >= randomValue ifTrue: [ ^ aCollection at: index ] ].
	Error signal.
]

{ #category : 'actions' }
Faker >> sample: aCollection withWeights: aCollectionOfWeights [
	^ (self sample: aCollection ofSize: 1 withWeights: aCollectionOfWeights) first
]

{ #category : 'actions' }
Faker >> samplewithWeights: aCollectionOfValusAndWeights [
	^ self
		sample: aCollectionOfValusAndWeights keys
		withWeights: aCollectionOfValusAndWeights values
]

{ #category : 'actions' }
Faker >> shuffle: aSequenceableCollection [
	"Randomly shuffle collection items"
	<return: #SequenceableCollection>
	self 
		assert: [ aSequenceableCollection isCollection ]
		description: [ 'Only collections can be shuffled' ].
	^ aSequenceableCollection shuffleBy: self random 
]

{ #category : 'actions' }
Faker >> uniqueSample: aCollection ofSize: aSize [
	"Return a given numer of items from the collection. 
	Ensure every value is sampled at most once."
	| indexes |
	<return: #Object>
	self 
		assert: [ aCollection isNotNil ]
		description: [ 'Only collections can be sampled' ].
	indexes := self shuffle: (1 to: aCollection size) asOrderedCollection.
	^ aSize timesCollect: [ :index |
		aCollection at: (indexes at: index) ]
]
