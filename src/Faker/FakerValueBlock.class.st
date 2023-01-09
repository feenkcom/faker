"
I generate a {{gtClass:Faker}} sample using {{gtMethod:FakerValueBlock>>block:}}. 
I am used by {{gtClass:FakerValue}}, see {{gtMethod:FakerValue class >> #block:}}. 
See the {{gtClass:FakerValue}} class comment for more details.

"
Class {
	#name : #FakerValueBlock,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Faker-Values'
}

{ #category : #accessing }
FakerValueBlock >> block [
	^ block
]

{ #category : #accessing }
FakerValueBlock >> block: aBlock [
	"aBlock receives one argument which is a Faker instance.
	aBlock returns a random sample (using the Faker instance)"

	block := aBlock
]

{ #category : #copying }
FakerValueBlock >> cull: aFaker [
	^ self value: aFaker
]

{ #category : #copying }
FakerValueBlock >> value: aFaker [
	self block ifNil: [ ^ nil ].

	^ self block cull: aFaker
]
