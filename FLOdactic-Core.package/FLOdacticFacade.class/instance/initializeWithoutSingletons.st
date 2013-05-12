initialize-release
initializeWithoutSingletons
	"This is a method only for use with the tests suite, in order to recreate objects all the time"

	users := UsersManager new.
	didacticMaterials := DidacticMaterialsManager new.
	tags := TagsManager new.
	
	search := SearchEngine new.
	"Need to set the same Managers into the SearchEngine, otherwise tests will fail"
	search didacticMaterialsManager: didacticMaterials.
	search usersManager: users.
	search tagsManager: tags.
	
	Transcript show: 'Creating users interface...'; crlf.
	^ self