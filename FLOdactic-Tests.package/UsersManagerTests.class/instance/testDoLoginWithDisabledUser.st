as yet unclassified
testDoLoginWithDisabledUser
	"comment stating purpose of message"

	user username: 'user'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'disabled'.
	
	self should: [usersManager doLogin: 'user' password: 'q'.] raise: Exception