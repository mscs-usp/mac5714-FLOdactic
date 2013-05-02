as yet unclassified
testDoLoginWithNonExistingUsername
	"comment stating purpose of message"

	user username: 'user'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self should: [usersManager doLogin: 'u' password: 'q'.] raise: Exception