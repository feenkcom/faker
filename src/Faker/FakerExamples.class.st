Class {
	#name : #FakerExamples,
	#superclass : #Object,
	#category : #'Faker-Examples'
}

{ #category : #base }
FakerExamples >> base [
	<gtExample>
	^ FakerBase new.
	
]

{ #category : #base }
FakerExamples >> numerify: aNumberPattern leadingZero: aBoolean [
	<gtExample>
	| aResult |
	aResult := self base numerify: aNumberPattern leadingZero: aBoolean.
	self assert: aResult isNotNil.
	self assert: aResult isString.
	self assert: (aResult includesSubstring: '#') not.
	^ aResult
]

{ #category : #base }
FakerExamples >> numerifyWithZeros [
	<gtExample>
	| aResult |
	aResult := self base numerify: '(Chile) +56 9 #### ####' leadingZero: true.
	self assert: (aResult matchesRegex: '\(Chile\) \+56 9 \d\d\d\d \d\d\d\d').
	^ aResult
]

{ #category : #base }
FakerExamples >> numerifyWithoutZeros [
	<gtExample>
	| aResult |
	aResult := self base numerify: '(Chile) +56 9 #### ####' leadingZero: false.
	self assert: (aResult matchesRegex: '\(Chile\) \+56 9 [1-9]\d\d\d \d\d\d\d').
	^ aResult
]
