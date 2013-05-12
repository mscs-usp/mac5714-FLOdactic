as yet unclassified
testUserIsEnabled
	"comment stating purpose of message"

	admin username: 'john'; password: 'a'; name: 'John Smith'; email: 'john@flodactic.org'; withAdminPrivileges; doEnable.
	admin1 username: 'joane'; password: 'b'; name: 'Joane Smith'; email: 'joane@flodactic.org'; withAdminPrivileges; doEnable.
	admin2 username: 'charles'; password: 'c'; name: 'Charles Davis'; email: 'charles@flodactic.org'; withAdminPrivileges; doEnable.
	
	
	
	self assert: (admin isEnabled = true).