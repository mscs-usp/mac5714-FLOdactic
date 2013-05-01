as yet unclassified
testEmptyName
	"comment stating purpose of message"

	| admin usersManager |
	admin := User new.
	admin username: 'admin'; password: 'q'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	
	self should: [usersManager add: admin.] raise: Exception