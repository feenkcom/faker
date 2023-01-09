"
I generate a {{gtClass:Faker}} sample using {{gtMethod:FakerValuePath>>path:}}. 
I am used by {{gtClass:FakerValue}}, see {{gtMethod:FakerValue class >> #path:}}. 
See the {{gtClass:FakerValue}} class comment for more details.

"
Class {
	#name : #FakerValuePath,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #'Faker-Values'
}

{ #category : #copying }
FakerValuePath >> cull: aFaker [
	^ self value: aFaker
]

{ #category : #'gt - extensions' }
FakerValuePath >> gtPathFor: aView [
	<gtView>
	self path ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Path';
		items: [ self path ifNil: #() ];
		column: 'Path' text: #yourself
]

{ #category : #accessing }
FakerValuePath >> path [
	<return: #Collection of: #String>
	^ path
]

{ #category : #accessing }
FakerValuePath >> path: aPath [
	"aPath can be a string, e.g., `person.firstName` which defines a Faker modules and methods to call. For example the `person.firstName` path defines the following `aFaker person firstName` call.
	
	aPath can also be a collection, e.g., #(person firstName)."

	path := aPath isString
			ifTrue: [ ($. split: aPath) collect: #asSymbol ]
			ifFalse: [ aPath collect: #asSymbol ]
]

{ #category : #copying }
FakerValuePath >> value: aFaker [
	| aModule |
	self path ifNil: [ ^ nil ].
	self path ifEmpty: [ ^ nil ].

	aModule := aFaker.
	self path do: [ :eachStep | aModule := aModule perform: eachStep asSymbol ].

	^ aModule
]
