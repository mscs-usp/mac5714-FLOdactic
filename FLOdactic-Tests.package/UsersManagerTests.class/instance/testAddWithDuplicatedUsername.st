as yet unclassified
testAddWithDuplicatedUsername
	"Test for duplicated usernames"

	self tearDown.
	self setUp.
	user1 username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; withAdminPrivileges; doEnable.
	user2 username: 'admin'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'rodrigo@flodactic.org'; withAdminPrivileges; doEnable.
	usersManager add: user1.
	
	self should: [usersManager add: user2.] raise: ValidationError