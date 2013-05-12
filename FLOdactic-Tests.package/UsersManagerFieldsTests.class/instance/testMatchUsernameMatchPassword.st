as yet unclassified
testMatchUsernameMatchPassword
	"comment stating purpose of message"

	admin username: 'leo'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; withAdminPrivileges; doEnable.
	
	self assert: ((admin matchUsername: 'leo' matchPassword: 'q') = true).