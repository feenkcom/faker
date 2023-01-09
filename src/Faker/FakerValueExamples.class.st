"
I exemplify {{gtClass:FakerValue}}. 
"
Class {
	#name : #FakerValueExamples,
	#superclass : #Object,
	#category : #'Faker-Examples'
}

{ #category : #'person dictionary' }
FakerValueExamples >> personDictionaryPathSample [
	<gtExample>
	| aTemplate aSample |
	aTemplate := self personDictionaryPathTemplate.

	aSample := aTemplate copyWithFaker: Faker new.

	self assert: aSample isDictionary.
	self assert: aSample size equals: aTemplate size.
	self assert: aSample ~= aTemplate.

	self assert: (aSample at: #firstName) isString.
	self assert: (aSample at: #lastName) isString.
	self assert: ((aSample at: #birthday) isKindOf: Timespan).

	^ aSample
]

{ #category : #'person dictionary' }
FakerValueExamples >> personDictionaryPathTemplate [
	<gtExample>
	| aTemplate |
	aTemplate := OrderedDictionary new.

	aTemplate at: #firstName put: (FakerValue path: 'person.firstName').
	aTemplate at: #lastName put: (FakerValue path: #(person lastName)).
	aTemplate
		at: #birthday
		put: (FakerValue
				block: [ :aFaker | aFaker date between: 1950 asYear and: 2010 asYear ]).

	^ aTemplate
]

{ #category : #'person dictionary' }
FakerValueExamples >> personDictionarySample [
	<gtExample>
	| aTemplate aSample |
	aTemplate := self personDictionaryTemplate.

	aSample := aTemplate copyWithFaker: Faker new.

	self assert: aSample isDictionary.
	self assert: aSample size equals: aTemplate size.
	self assert: aSample ~= aTemplate.

	^ aSample
]

{ #category : #'person dictionary' }
FakerValueExamples >> personDictionarySample_SecondTime [
	<gtExample>
	| aSample aSecondSample |
	aSample := self personDictionarySample.
	aSecondSample := aSample copyWithFaker: Faker new.

	self assert: aSample = aSecondSample.
	self assert: (aSample == aSecondSample) not.

	^ aSecondSample
]

{ #category : #'person dictionary' }
FakerValueExamples >> personDictionaryTemplate [
	<gtExample>
	| aTemplate |
	aTemplate := OrderedDictionary new.

	aTemplate
		at: #firstName
		put: (FakerValue block: [ :aFaker | aFaker person firstName ]).
	aTemplate
		at: #lastName
		put: (FakerValue block: [ :aFaker | aFaker person lastName ]).
	aTemplate
		at: #birthday
		put: (FakerValue
				block: [ :aFaker | aFaker date between: 1950 asYear and: 2010 asYear ]).

	^ aTemplate
]

{ #category : #'person model' }
FakerValueExamples >> personModelSample [
	<gtExample>
	| aTemplate aSample |
	aTemplate := self personModelTemplate.

	aSample := aTemplate copyWithFaker: Faker new.

	self assert: aSample class equals: aTemplate class.
	self assert: aSample ~= aTemplate.
	self assert: aSample firstName isString.
	self assert: aSample lastName isString.
	self assert: (aSample birthday isKindOf: Timespan).

	^ aSample
]

{ #category : #'person dictionary' }
FakerValueExamples >> personModelSample_SecondTime [
	<gtExample>
	| aSample aSecondSample |
	aSample := self personModelSample.
	aSecondSample := aSample copyWithFaker: Faker new.

	self assert: (aSample == aSecondSample) not.
	self assert: (aSample = aSecondSample) not.
	self assert: aSecondSample firstName equals: aSample firstName.
	self assert: aSecondSample lastName equals: aSample lastName.
	self assert: aSecondSample birthday equals: aSample birthday.

	^ aSecondSample
]

{ #category : #'person model' }
FakerValueExamples >> personModelTemplate [
	<gtExample>
	| aModel |
	aModel := FakerPersonDummyModel new.

	aModel firstName: (FakerValue path: 'person.firstName').
	aModel lastName: (FakerValue block: [ :aFaker | aFaker person lastName ]).
	aModel
		birthday: (FakerValue
				block: [ :aFaker | aFaker date between: 1950 asYear and: 2010 asYear ]).

	^ aModel
]
