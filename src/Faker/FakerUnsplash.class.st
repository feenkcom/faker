Class {
	#name : #FakerUnsplash,
	#superclass : #FakerModule,
	#category : #'Faker-Modules'
}

{ #category : #accessing }
FakerUnsplash >> photo [
	<return: #FakerUnsplashPhoto or: #FakerResponseError>
	| aResponse aQuery |
	aQuery := self properties unsplashQuery.
	aResponse := self randomPhotosQuery: aQuery count: 1.

	^ aResponse isSuccess
		ifTrue: [ aResponse data first ]
		ifFalse: [ aResponse ]
]

{ #category : #accessing }
FakerUnsplash >> photos [
	<return: #Collection of: #FakerUnsplashPhoto>
	<return: #FakerResponseError>
	| aQuery aCount aResponse |
	aQuery := self properties unsplashQuery.
	aCount := self properties unsplashCount.

	aResponse := self randomPhotosQuery: aQuery count: aCount.
	^ aResponse isSuccess ifTrue: [ aResponse data ] ifFalse: [ aResponse ]
]

{ #category : #private }
FakerUnsplash >> randomPhotosQuery: aQuery count: aCount [
	<return: #FakerResponse>
	| aClient anUrl aResponse aData aToken aJson |
	aToken := self properties unsplashAccessKey.

	anUrl := 'https://api.unsplash.com/photos/random' asZnUrl.
	aQuery ifNotNil: [ anUrl queryAt: 'query' put: aQuery ].
	aCount ifNotNil: [ anUrl queryAt: 'count' put: aCount ].

	aClient := ZnClient new.
	aClient url: anUrl.
	aClient
		prepareRequest: [ :aRequest | aRequest setAuthorization: 'Client-ID ' , aToken asString ].

	aResponse := aClient
			get;
			response.

	aResponse isSuccess ifFalse: [ ^ FakerResponseError new response: aResponse ].

	aJson := STONJSON fromString: aResponse contents.
	aData := aJson collect: [ :eachPhoto | FakerUnsplashPhoto new json: eachPhoto ].

	^ FakerResponseSuccess new
		response: aResponse;
		data: aData
]
