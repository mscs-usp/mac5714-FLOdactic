as yet unclassified
setUp
	"Variables setup for the test"
	
	user := User new.
	user username: 'user'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; withAdminPrivileges; doEnable.
	
	user1 := User new.
	user2 := User new.
	usersManager := UsersManager new.