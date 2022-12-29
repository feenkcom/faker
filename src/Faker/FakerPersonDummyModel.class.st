Class {
	#name : #FakerPersonDummyModel,
	#superclass : #FakerBasicPersonDummyModel,
	#instVars : [
		'birthday'
	],
	#category : #'Faker-Examples'
}

{ #category : #accessing }
FakerPersonDummyModel >> birthday [
	^ birthday
]

{ #category : #accessing }
FakerPersonDummyModel >> birthday: anObject [
	birthday := anObject
]
