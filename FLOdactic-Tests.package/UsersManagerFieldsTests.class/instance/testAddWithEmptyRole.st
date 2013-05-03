as yet unclassified
testAddWithEmptyRole
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; status: 'enabled'.
	
	self should: [usersManager add: admin.] raise: Exception