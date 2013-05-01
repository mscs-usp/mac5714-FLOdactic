as yet unclassified
testEmptyUsername
	"comment stating purpose of message"

	| admin usersManager |
	admin := User new.
	admin password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	
	self should: [usersManager add: admin.] raise: Exception