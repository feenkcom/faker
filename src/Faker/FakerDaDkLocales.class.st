Class {
	#name : #FakerDaDkLocales,
	#superclass : #FakerLocales,
	#category : #'Faker-Locales'
}

{ #category : #module }
FakerDaDkLocales >> nameModule [
	^ FakerDaDkNameLocaleModule new base: self base
]
