as yet unclassified
testAddWithDuplicatedEmails
	"Test for duplicated emails"

	user1 username: 'admin1'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	user2 username: 'admin1'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	usersManager add: user1.
	
	self should: [usersManager add: user2.] raise: Exception