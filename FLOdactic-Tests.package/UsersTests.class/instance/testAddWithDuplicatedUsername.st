as yet unclassified
testAddWithDuplicatedUsername
	"Test for duplicated usernames"

	admin1 username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	admin2 username: 'admin'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'rodrigo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	usersManager add: admin1.
	
	self should: [usersManager add: admin2.] raise: Exception