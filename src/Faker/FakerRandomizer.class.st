"
I describe a random {{gtMethod:FakerRandomizer>>#value | label=#selector}}, using {{gtMethod:FakerRandomizer>>#name | label=#selector}} and {{gtMethod:FakerRandomizer>>#description | label=#selector}}. 
"
Class {
	#name : #FakerRandomizer,
	#superclass : #Object,
	#instVars : [
		'description',
		'value',
		'name'
	],
	#category : #'Faker-Values'
}

{ #category : #accessing }
FakerRandomizer >> description [
	<return: #String>
	^ description
]

{ #category : #accessing }
FakerRandomizer >> description: anObject [
	description := anObject
]

{ #category : #accessing }
FakerRandomizer >> name [
	<return: #String>
	^ name
]

{ #category : #accessing }
FakerRandomizer >> name: anObject [
	name := anObject
]

{ #category : #printing }
FakerRandomizer >> printOn: aStream [
	super printOn: aStream.

	self name ifNil: [ ^ self ].
	aStream
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

{ #category : #accessing }
FakerRandomizer >> value [
	<return: #FakerValue>
	^ value
]

{ #category : #accessing }
FakerRandomizer >> value: aFakerValue [
	"Set a Faker value that generates random values"

	value := aFakerValue
]
