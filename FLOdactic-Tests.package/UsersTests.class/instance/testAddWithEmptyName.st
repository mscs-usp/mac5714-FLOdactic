as yet unclassified
testAddWithEmptyName
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self should: [usersManager add: admin.] raise: Exception