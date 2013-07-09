as yet unclassified
updateUrl: aUrl
	super updateUrl: aUrl.
	aUrl addToPath: (self pathFor: currentPage title)
	