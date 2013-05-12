as yet unclassified
testAddWithEmptyName
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; email: 'leo@flodactic.org'; withAdminPrivileges; doEnable.
	
	self should: [usersManager add: admin.] raise: ValidationError