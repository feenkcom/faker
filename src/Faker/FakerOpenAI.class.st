"
I generate content using [](https://openai.com). 
#Usage
```Smalltalk
Faker new
	in: [ :aFaker | 
		aFaker properties
			openaiApiKey: (FileLocator home / '.secrets' / 'open-ai-api-key.txt') contents;
			openaiImagePrompt: 'book cover named Open Mind'.
		aFaker openai image ]
```

"
Class {
	#name : #FakerOpenAI,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerOpenAI >> image [
	<return: #FakerOpenAIImage or: #FakerResponse>
	| aResponse aPrompt |
	aPrompt := self properties openaiImagePrompt.
	aResponse := self randomImagePrompt: aPrompt count: 1.

	^ aResponse isSuccess ifTrue: [ aResponse data first ] ifFalse: [ aResponse ]
]

{ #category : #accessing }
FakerOpenAI >> images [
	<return: #Collection of: #FakerOpenAIImage>
	<return: #FakerResponse>
	| aPrompt aCount aResponse |
	aPrompt := self properties openaiImagePrompt.
	aCount := self properties openaiImageCount.

	aResponse := self randomImagePrompt: aPrompt count: aCount.
	^ aResponse isSuccess ifTrue: [ aResponse data ] ifFalse: [ aResponse ]
]

{ #category : #accessing }
FakerOpenAI >> photo [
	<return: #FakerOpenAIImage or: #FakerResponse>
	^ self image
]

{ #category : #accessing }
FakerOpenAI >> photos [
	<return: #Collection of: #FakerOpenAIImage>
	<return: #FakerResponse>
	^ self images
]

{ #category : #private }
FakerOpenAI >> randomImagePrompt: aPrompt count: aCount [
	<return: #FakerResponse>
	| aClient anUrl aResponse aData aToken aJson aBody aJsonImages |
	aToken := self properties openaiApiKey.

	anUrl := 'https://api.openai.com/v1/images/generations' asZnUrl.

	aBody := Dictionary new.
	aPrompt ifNotNil: [ aBody at: 'prompt' put: aPrompt asString ].
	aCount ifNotNil: [ aBody at: 'n' put: aCount ].

	aClient := ZnClient new.
	aClient url: anUrl.
	aClient entity: (ZnEntity json: (STONJSON toString: aBody)).
	aClient setBearerAuthentication: aToken asString.

	aResponse := aClient
			post;
			response.

	aResponse isSuccess ifFalse: [ ^ FakerResponseError new response: aResponse ].

	aJson := STONJSON fromString: aResponse contents.
	aJsonImages := aJson
			at: #data
			ifAbsent: [ ^ FakerResponseProblem new
					response: aResponse;
					data: aJson;
					message: 'OpenAI response does not include data' ].
	aData := aJsonImages
			collect: [ :eachPhoto | FakerOpenAIImage new json: eachPhoto ].

	^ FakerResponseSuccess new
		response: aResponse;
		data: aData
]
