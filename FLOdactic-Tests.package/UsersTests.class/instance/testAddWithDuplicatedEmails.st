as yet unclassified
testAddWithDuplicatedEmails
	"Test for duplicated emails"

	admin1 username: 'admin1'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	admin2 username: 'admin1'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	usersManager add: admin1.
	
	self should: [usersManager add: admin2.] raise: Exception