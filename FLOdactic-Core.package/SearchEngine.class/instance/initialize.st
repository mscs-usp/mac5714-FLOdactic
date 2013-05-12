as yet unclassified
initialize
	super initialize.
	didacticMaterialsManager := DidacticMaterialsManager singleton.
	usersManager := UsersManager singleton.
	tagsManager := TagsManager singleton.
	
	searchResults := nil.