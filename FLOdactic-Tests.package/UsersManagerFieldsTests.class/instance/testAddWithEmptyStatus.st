as yet unclassified
testAddWithEmptyStatus
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'.
	
	self should: [usersManager add: admin.] raise: Exception