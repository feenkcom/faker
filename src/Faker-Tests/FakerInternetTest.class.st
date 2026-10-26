"
A FakerInternetTest is a test class for testing the behavior of FakerInternet
"
Class {
	#name : #FakerInternetTest,
	#superclass : #TestCase,
	#category : #'Faker-Tests-Modules'
}

{ #category : #tests }
FakerInternetTest >> testUrl [
| url |
	url := Faker new internet url.
	self assert: [ url beginsWith: 'http' ]
	description: 'Url produced in sot well formatted'
]
