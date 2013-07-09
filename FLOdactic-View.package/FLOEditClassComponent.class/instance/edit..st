as yet unclassified
edit: anItem
	super edit: anItem.
	item instructor ifNotNil: [
		selectedInstructorUser := item instructor username ]