Class {
	#name : #FakerDaLocales,
	#superclass : #FakerLocales,
	#category : #'Faker-Locales'
}

{ #category : #module }
FakerDaLocales >> nameModule [
	^ FakerDaDkNameLocaleModule new base: self base
]
