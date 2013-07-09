as yet unclassified
initialize
	super initialize.
	material := DidacticMaterial new.
	isEditing := false.
	
	search := SearchEngine new.
	selectedTags := Set new.
	selectedAuthors := Set new.
	selectedUsers := Set new.
	