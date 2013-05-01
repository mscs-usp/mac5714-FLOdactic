as yet unclassified
testDuplicatedUsername
	"Test for duplicated usernames"

	| admin1 admin2 usersManager |
	admin1 := User new.
	admin1 username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	admin2 := User new.
	admin2 username: 'admin'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'rodrigo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	usersManager := UsersManager new.
	usersManager add: admin1.
	
	self should: [usersManager add: admin2.] raise: Exception