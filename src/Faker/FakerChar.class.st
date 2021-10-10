Class {
	#name : #FakerChar,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Faker-Modules'
}

{ #category : #cleanup }
FakerChar class >> cleanUp [
	self resetUniqueInstance
]

{ #category : #cleanup }
FakerChar class >> resetUniqueInstance [
	uniqueInstance := nil
]

{ #category : #accessing }
FakerChar class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #selection }
FakerChar >> prepare: aString [
	"Replace unwanted characters, e.g., äöüß and others. 
	For now we only convert to lowercase"
	^ aString asLowercase 
		copyWithRegex: '\W' matchesReplacedWith: ''
]
