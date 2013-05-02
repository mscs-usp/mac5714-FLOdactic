as yet unclassified
testAddWithDuplicatedUsername
	"Test for duplicated usernames"

	user1 username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	user2 username: 'admin'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'rodrigo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	usersManager add: user1.
	
	self should: [usersManager add: user2.] raise: Exception