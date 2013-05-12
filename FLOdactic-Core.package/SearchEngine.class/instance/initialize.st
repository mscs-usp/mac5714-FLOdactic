initialize-release
initialize
	"Class responsability: Takes care of searches on the DidacticMaterialsManager, TagsManager and UsersManager singletons instances"
	
	super initialize.
	didacticMaterialsManager := DidacticMaterialsManager singleton.
	usersManager := UsersManager singleton.
	tagsManager := TagsManager singleton.
	
	searchResults := nil.