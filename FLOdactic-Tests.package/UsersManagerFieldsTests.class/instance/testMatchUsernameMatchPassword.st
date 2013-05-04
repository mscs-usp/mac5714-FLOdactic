as yet unclassified
testMatchUsernameMatchPassword
	"comment stating purpose of message"

	admin username: 'leo'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self assert: ((admin matchUsername: 'leo' matchPassword: 'q') = true).