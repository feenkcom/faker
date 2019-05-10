Class {
	#name : #FakerExamples,
	#superclass : #Object,
	#category : #'Faker-Examples'
}

{ #category : #company }
FakerExamples >> companyName [
	<gtExample>
	| aResult |
	aResult := self faker company name.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]

{ #category : #base }
FakerExamples >> faker [
	<gtExample>
	^ Faker new.
	
]

{ #category : #internet }
FakerExamples >> internetUsername [
	<gtExample>
	| aResult |
	aResult := self faker internet username.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]

{ #category : #base }
FakerExamples >> numerifyWithZeros [
	<gtExample>
	| aResult |
	aResult := self faker numerify: '(Chile) +56 9 #### ####' leadingZero: true.
	self assert: (aResult matchesRegex: '\(Chile\) \+56 9 \d\d\d\d \d\d\d\d').
	^ aResult
]

{ #category : #base }
FakerExamples >> numerifyWithoutZeros [
	<gtExample>
	| aResult |
	aResult := self faker numerify: '(Chile) +56 9 #### ####' leadingZero: false.
	self assert: (aResult matchesRegex: '\(Chile\) \+56 9 [1-9]\d\d\d \d\d\d\d').
	^ aResult
]

{ #category : #person }
FakerExamples >> personFirstName [
	<gtExample>
	| aResult |
	aResult := self faker firstName.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]

{ #category : #person }
FakerExamples >> personLastName [
	<gtExample>
	| aResult |
	aResult := self faker lastName.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]

{ #category : #base }
FakerExamples >> prepareString [
	<gtExample>
	| aString aResult |
	aString := 'ABC 234rs@#$,. xyz'.
	aResult := self faker prepareString: aString.
	self assert: aResult equals: 'abc234rsxyz'.
	^ aResult
]

{ #category : #base }
FakerExamples >> shuffleArrayOfNumbers [
	<gtExample>
	| aCollection aResult |
	aCollection := #( 3 5 9 8 3 4 ).
	aResult := self faker shuffle: aCollection.
	self assert: aResult isCollection.
	self assert: aResult class equals: aCollection class.
	self assert: aResult size equals: aCollection size.
	^ aResult
]
