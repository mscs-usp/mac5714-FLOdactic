as yet unclassified
testAddWithEmptyEmail
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; role: 'administrator'; status: 'enabled'.
	
	self should: [usersManager add: admin.] raise: Exception