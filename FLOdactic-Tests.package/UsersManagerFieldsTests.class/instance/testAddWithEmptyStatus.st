as yet unclassified
testAddWithEmptyStatus
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; withAdminPrivileges.
	
	self should: [usersManager add: admin.] raise: ValidationError