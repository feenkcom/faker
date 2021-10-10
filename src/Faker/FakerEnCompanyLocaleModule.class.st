Class {
	#name : #FakerEnCompanyLocaleModule,
	#superclass : #FakerEnLocaleModule,
	#traits : 'TFakerCompanyLocaleModule',
	#classTraits : 'TFakerCompanyLocaleModule classTrait',
	#category : 'Faker-Locales'
}

{ #category : #company }
FakerEnCompanyLocaleModule >> companyNames [
	^ {
			[ ( String space join: { self base lastName . self companySuffix } ) ].
			[ ( String empty join: { self base firstName. '-' . self base lastName } ) ].
			[ ( String space join: { self base firstName. self base lastName . 'and' . self base lastName } ) ]
		}
]

{ #category : #company }
FakerEnCompanyLocaleModule >> companySuffixes [
	^ #( 'Inc' 'and Sons' 'LLC' 'Group' )
]
