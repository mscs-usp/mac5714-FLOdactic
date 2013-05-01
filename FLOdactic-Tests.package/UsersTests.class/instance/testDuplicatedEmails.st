as yet unclassified
testDuplicatedEmails
	"Test for duplicated emails"

	| admin1 admin2 usersManager |
	admin1 := User new.
	admin1 username: 'admin1'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.

	admin2 := User new.
	admin2 username: 'admin1'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	usersManager add: admin1.
	
	self should: [usersManager add: admin2.] raise: Exception