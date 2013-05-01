as yet unclassified
testAddWithEmptyUsername
	"comment stating purpose of message"

	admin password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self should: [usersManager add: admin.] raise: Exception