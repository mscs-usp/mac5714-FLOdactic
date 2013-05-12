as yet unclassified
testAddWithEmptyEmail
	"comment stating purpose of message"

	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; withAdminPrivileges; doEnable.
	
	self should: [usersManager add: admin.] raise: ValidationError