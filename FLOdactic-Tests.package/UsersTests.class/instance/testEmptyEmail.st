as yet unclassified
testEmptyEmail
	"comment stating purpose of message"

	| admin usersManager |
	admin := User new.
	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	
	self should: [usersManager add: admin.] raise: Exception