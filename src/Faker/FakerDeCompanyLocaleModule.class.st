Class {
	#name : 'FakerDeCompanyLocaleModule',
	#superclass : 'FakerDeLocaleModule',
	#traits : 'TFakerCompanyLocaleModule',
	#classTraits : 'TFakerCompanyLocaleModule classTrait',
	#category : 'Faker-Locales'
}

{ #category : 'company' }
FakerDeCompanyLocaleModule >> companyNames [
	^ {
			[ ( String space join: { self base lastName . self companySuffix } ) ].
			[ ( String empty join: { self base firstName. '-' . self base lastName } ) ].
			[ ( String space join: { self base firstName. self base lastName . 'und' . self base lastName } ) ]
		}
]

{ #category : 'company' }
FakerDeCompanyLocaleModule >> companySuffixes [
	^ #( 'GmbH' 'AG' 'Gruppe' 'KG' 'GmbH & Co. KG' 'UG' 'OHG' )
]
