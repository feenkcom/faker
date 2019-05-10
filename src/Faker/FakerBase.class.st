Class {
	#name : #FakerBase,
	#superclass : #Object,
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

{ #category : #accessing }
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
