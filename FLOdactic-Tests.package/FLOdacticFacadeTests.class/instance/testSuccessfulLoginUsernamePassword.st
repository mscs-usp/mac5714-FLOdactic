as yet unclassified
testSuccessfulLoginUsernamePassword
	"comment stating purpose of message"

	| login |

	self tearDown.
	self setUp.
	testui loggedUser ifNotNil: [
		testui doLogout.
	].
	login := testui doLogin: 'albert' password: 'pass'.
	self assert: (login = true).