as yet unclassified
owner: anOwner edit: anItem
	"Edits a Course"
	| item |
	self validate: anItem forExistingKey: anItem code.
	
	item := self findActualItem: anItem.
	item copyFrom: anItem.

	Transcript show: 'Editing: *', anItem code, '*'; cr.
	anItem touch.