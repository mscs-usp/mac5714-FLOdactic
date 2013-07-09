as yet unclassified
initialize
	super initialize.
	item := self itemClass new.
	isEditing := false.
	
	search := SearchEngine new.
	selectedTags := Set new.
	selectedColaborators := Set new.
	