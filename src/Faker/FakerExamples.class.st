Class {
	#name : #FakerExamples,
	#superclass : #Object,
	#category : #'Faker-Examples'
}

{ #category : #base }
FakerExamples >> base [
	<gtExample>
	^ Faker new.
	
]

{ #category : #accessing }
FakerExamples >> englishCommonFamilyName [
	<gtExample>
	| aResult |
	aResult := self base lastName.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]

{ #category : #accessing }
FakerExamples >> englishCommonFirstName [
	<gtExample>
	| aResult |
	aResult := self base firstName.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
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

{ #category : #accessing }
FakerExamples >> prepareString [
	<gtExample>
	| aString aResult |
	aString := 'ABC 234rs@#$,. xyz'.
	aResult := self base prepareString: aString.
	self assert: aResult equals: 'abc234rsxyz'.
	^ aResult
]

{ #category : #accessing }
FakerExamples >> shuffleArrayOfNumbers [
	<gtExample>
	| aCollection aResult |
	aCollection := #( 3 5 9 8 3 4 ).
	aResult := self base shuffle: aCollection.
	self assert: aResult isCollection.
	self assert: aResult class equals: aCollection class.
	self assert: aResult size equals: aCollection size.
	^ aResult
]

{ #category : #accessing }
FakerExamples >> username [
	<gtExample>
	| aResult |
	aResult := self base internet username.
	self assert: aResult isString.
	self assert: aResult isNotEmpty.
	^ aResult
]
