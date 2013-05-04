as yet unclassified
testSuccessfulLoginUsernamePassword
	"comment stating purpose of message"

	| login |
	login := testui doLogin: 'albert' password: 'pass'.
	self assert: (login = true).