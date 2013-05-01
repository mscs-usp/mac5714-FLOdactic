as yet unclassified
testEmptyStatus
	"comment stating purpose of message"

	| admin usersManager |
	admin := User new.
	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'.

	usersManager := UsersManager new.
	
	self should: [usersManager add: admin.] raise: Exception