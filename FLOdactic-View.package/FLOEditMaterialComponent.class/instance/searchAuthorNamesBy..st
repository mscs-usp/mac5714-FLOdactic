as yet unclassified
searchAuthorNamesBy: aString
	^ (search searchAuthors: aString) values collect: [ :author | author name ]