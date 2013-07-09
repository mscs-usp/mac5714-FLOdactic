as yet unclassified
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self title.
	JQBaseTheme default updateRoot: anHtmlRoot.
	FLOBootstrapLibrary default updateRoot: anHtmlRoot