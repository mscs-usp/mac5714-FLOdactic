as yet unclassified
testFailedLoginUsernamePassword
	"comment stating purpose of message"

	self should: [testui doLogin: 'albert' password: 'wrong'..] raise: Exception.
