as yet unclassified
testDoLoginWithWrongPassword
	"comment stating purpose of message"

	user username: 'user'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; withAdminPrivileges; doEnable.
	
	self should: [usersManager doLogin: 'user' password: 'wrong'.] raise: PermissionError