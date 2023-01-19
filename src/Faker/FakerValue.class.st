"
I know how to generate random values.
I use a {{gtMethod:FakerValue >>builder:}} to generate random values.
#Examples
##JSON Object
The following example shows a JSON Object **template** with random values: {{gtExample: FakerValueExamples >> #personDictionaryTemplate | codeExpanded=false | previewExpanded=true | previewHeight=220}}
Such template can be converted to a **sample** with random values using the {{gtMethod: Object >> #copyWithFaker: | label=#selector}} method: {{gtExample: FakerValueExamples >> #personDictionarySample | codeExpanded=false | previewExpanded=true | previewHeight=220}}
##Model Object
The same {{gtClass:FakerValue}} definitions can be used on model objects, e.g., {{gtClass:FakerPersonDummyModel}}. See the following **template**: {{gtExample: FakerValueExamples>>#personModelTemplate | codeExpanded=false | previewExpanded=true | previewHeight=220}}
and a resulting **sample**: {{gtExample: FakerValueExamples>>#personModelSample | codeExpanded=false | previewExpanded=true | previewHeight=220}}
##Faker Path
The examples above uses {{gtMethod:FakerValue class>> #builder:}}. Users can used simplified value definitions using {{gtMethod: FakerValue class >> #path:}} as exemplified in the following example: {{gtExample: FakerValueExamples>>#personDictionaryPathTemplate | previewHeight=220}}
"
Class {
	#name : #FakerValue,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #'Faker-Values'
}

{ #category : #'instance creation' }
FakerValue class >> block: aBlock [
	"aBlock receives one argument which is a Faker instance.
	aBlock returns a random sample (using the Faker instance)"

	^ self builder: (FakerValueBlock new block: aBlock)
]

{ #category : #'instance creation' }
FakerValue class >> builder: aBuilder [
	"Builder must be a an object that understands #cull:.
	The builder receives a Faker instance as parameter."

	^ self new builder: aBuilder
]

{ #category : #'instance creation' }
FakerValue class >> path: aPath [
	"aPath can be a string, e.g., `person.firstName` which defines a Faker modules and methods to call. For example the `person.firstName` path defines the following `aFaker person firstName` call.
	
	aPath can also be a collection, e.g., #(person firstName)."

	^ self builder: (FakerValuePath new path: aPath)
]

{ #category : #accessing }
FakerValue >> builder [
	^ builder
]

{ #category : #accessing }
FakerValue >> builder: aBuilder [
	"Builder must be a an object that understands #cull:.
	The builder receives a Faker instance as parameter."

	builder := aBuilder
]

{ #category : #copying }
FakerValue >> copyWithFaker: aFaker [
	self builder ifNil: [ ^ nil ].
	^ self builder cull: aFaker
]

{ #category : #printing }
FakerValue >> gtDisplayOn: stream [
	self builder
		ifNil: [ super gtDisplayOn: stream.
			^ self ].

	stream nextPutAll: 'Random value: '.
	self sample gtDisplayOn: stream
]

{ #category : #printing }
FakerValue >> printOn: aStream [
	super printOn: aStream.
	self builder ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: 'Random value: ';
		print: self sample;
		nextPut: $)
]

{ #category : #copying }
FakerValue >> sample [
	^ self copyWithFaker: Faker new
]
