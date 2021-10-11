Class {
	#name : #FakerDaDkCompanyLocaleModule,
	#superclass : #FakerDaDkLocaleModule,
	#traits : 'TFakerCompanyLocaleModule',
	#classTraits : 'TFakerCompanyLocaleModule classTrait',
	#category : #'Faker-Locales'
}

{ #category : #'company - raw data' }
FakerDaDkCompanyLocaleModule >> companyNames [
	^ {
			[ ( String space join: { self base lastName . self companySuffix } ) ].
			[ ( String empty join: { self base firstName. '-' . self base lastName } ) ].
			[ ( String space join: { self base firstName. self base lastName . 'og' . self base lastName } ) ]
		}
]

{ #category : #'company - raw data' }
FakerDaDkCompanyLocaleModule >> companySuffixes [
	^ #('A/S' 'ApS' 'I/S' 'IVS' 'Holding' 'SMBA' 'K/S' 'SPW')
]
