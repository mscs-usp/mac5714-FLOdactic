accessing
addAuthor: anAuthor
	"Adds anAuthor to the authors"
	
	"author := anAuthor."
	authors add: (anAuthor name) -> anAuthor.
	self touch.