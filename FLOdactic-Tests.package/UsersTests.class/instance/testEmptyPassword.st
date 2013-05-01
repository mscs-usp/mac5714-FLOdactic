as yet unclassified
testEmptyPassword
	"comment stating purpose of message"

	| admin usersManager |
	admin := User new.
	admin username: 'admin'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	
	self should: [usersManager add: admin.] raise: Exception