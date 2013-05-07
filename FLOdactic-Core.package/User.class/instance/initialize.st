accessing
initialize
	super initialize.
	
	"Mandatory user's attributes"
	username := nil.
	password := nil.
	email := nil.
	
	"Automatic attributes (defined by the manager)"
	role := nil.
	status := nil.