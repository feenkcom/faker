Class {
	#name : #FakerOpenAIImage,
	#superclass : #Object,
	#instVars : [
		'json'
	],
	#category : #'Faker-Support'
}

{ #category : #testing }
FakerOpenAIImage >> isSuccess [
	^ true
]

{ #category : #accessing }
FakerOpenAIImage >> json [
	^ json
]

{ #category : #accessing }
FakerOpenAIImage >> json: anObject [
	json := anObject
]

{ #category : #accessing }
FakerOpenAIImage >> url [
	^ self json at: #url ifAbsent: [ nil ]
]
