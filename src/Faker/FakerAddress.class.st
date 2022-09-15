Class {
	#name : #FakerAddress,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerAddress >> fullAddress [
	^ self locales addressModule address.
]
