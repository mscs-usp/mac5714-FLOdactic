initialize-release
initialize
	"Class responsability: Abstract a session of a user on the FLOdactic system and centralize all user's actions on the system within a single access interface"

	users := UsersManager singleton.
	didacticMaterials := DidacticMaterialsManager singleton.
	tags := TagsManager singleton.
	courses := CoursesManager singleton.
	authors := AuthorsManager singleton.
	
	search := SearchEngine new.
	
	Transcript show: 'Creating users interface...'; crlf.
	
	"self populateWithTestData."
	Transcript show: 'Adding some bogus data...'; crlf.
	
	^ self