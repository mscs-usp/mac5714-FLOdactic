as yet unclassified
testAddWithEmptyUsername
	"comment stating purpose of message"

	admin password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; withAdminPrivileges; doEnable.
	
	self should: [usersManager add: admin.] raise: ValidationError