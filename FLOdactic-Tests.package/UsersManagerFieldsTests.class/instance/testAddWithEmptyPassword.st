as yet unclassified
testAddWithEmptyPassword
	"comment stating purpose of message"

	admin username: 'admin'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self should: [usersManager add: admin.] raise: Exception