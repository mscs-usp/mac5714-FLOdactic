accessing
addAuthor: aNameString
	"Adds an Author name to the tags"

	| author  manager |
	manager := AuthorsManager singleton.
	
	"does it exist?"
	(manager includesKey: aNameString) ifTrue: [
		author := manager at: aNameString ]
	"else, add it to the manager"
	ifFalse: [
		author := Author new.
		author name: aNameString.
		manager add: aNameString -> author ].
	"finally add it to the authors object Dictionary itself"
	authors add: aNameString -> author.