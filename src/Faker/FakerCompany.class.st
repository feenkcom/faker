Class {
	#name : 'FakerCompany',
	#superclass : 'FakerModule',
	#category : 'Faker-Modules'
}

{ #category : 'accessing' }
FakerCompany >> name [
	<return: #String>
	^ self locales companyName
]
