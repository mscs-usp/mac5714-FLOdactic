as yet unclassified
searchTagNamesBy: aString
	^ (search searchTags: aString) values collect: [ :tag | tag name ]