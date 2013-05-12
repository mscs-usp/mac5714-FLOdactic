accessing
addAuthor: anAuthor
	"author := anAuthor."
	authors add: (anAuthor name) -> anAuthor.
	self touch.