Class {
	#name : #FakerBase,
	#superclass : #Object,
	#instVars : [
		'configuration'
	],
	#classVars : [
		'Letters',
		'Numbers',
		'ULetters'
	],
	#category : #'Faker-Base'
}

{ #category : #'class initialization' }
FakerBase class >> initialize [
	Numbers := 0 to: 9.
	ULetters := Character alphabet.
   Letters := ULetters, ULetters asUppercase.
]

{ #category : #'accessing - modules' }
FakerBase >> char [
	<return: #FakerChar>
	^ FakerChar uniqueInstance
]

{ #category : #accessing }
FakerBase >> configuration [
	<return: #FakerConfiguration>
	^ configuration ifNil: [ configuration := self defaultConfiguration ]
]

{ #category : #defaults }
FakerBase >> defaultConfiguration [
	^ FakerConfiguration new
]

{ #category : #actions }
FakerBase >> familyName [
	<return: #String>
	^ self name familyName
]

{ #category : #actions }
FakerBase >> firstName [
	<return: #String>
	^ self name firstName
]

{ #category : #'accessing - modules' }
FakerBase >> internet [
	^ FakerInternet new base: self
]

{ #category : #'accessing - modules' }
FakerBase >> name [
	<return: #FakerChar>
	^ FakerName new base: self
]

{ #category : #actions }
FakerBase >> numerify: aNumberPattern leadingZero: aBoolean [
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

{ #category : #actions }
FakerBase >> prepareString: aString [ 
	<return: #String>
	^ self char prepare: aString
]

{ #category : #accessing }
FakerBase >> sample: aCollection [
	"Return any random item from the collection"
	<return: #Object>
	self 
		assert: [ aCollection isNotNil ]
		description: [ 'Only collections can be sampled' ].
	^ aCollection atRandom: self configuration random.
]

{ #category : #actions }
FakerBase >> shuffle: aSequenceableCollection [
	"Randomly shuffle collection items"
	<return: #SequenceableCollection>
	self 
		assert: [ aSequenceableCollection isCollection ]
		description: [ 'Only collections can be shuffled' ].
	^ aSequenceableCollection shuffleBy: self configuration random 
]
