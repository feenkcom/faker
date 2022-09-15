Class {
	#name : #FakerDaDkLocales,
	#superclass : #FakerLocales,
	#category : #'Faker-Locales'
}

{ #category : #accessing }
FakerDaDkLocales class >> localeCode [
	^ 'da_DK'
]

{ #category : #accessing }
FakerDaDkLocales >> addressModule [
	^ FakerDaDKAddressLocaleModule new base: self base.
]

{ #category : #module }
FakerDaDkLocales >> companyModule [
	^ FakerDaDkCompanyLocaleModule new base: self base
]

{ #category : #module }
FakerDaDkLocales >> nameModule [
	^ FakerDaDkNameLocaleModule new base: self base
]
