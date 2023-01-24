Class {
	#name : #FakerResponseProblem,
	#superclass : #FakerResponse,
	#instVars : [
		'data',
		'message'
	],
	#category : #'Faker-Support'
}

{ #category : #accessing }
FakerResponseProblem >> data [
	^ data
]

{ #category : #accessing }
FakerResponseProblem >> data: anObject [
	data := anObject
]

{ #category : #accessing }
FakerResponseProblem >> message [
	^ message
]

{ #category : #accessing }
FakerResponseProblem >> message: anObject [
	message := anObject
]
