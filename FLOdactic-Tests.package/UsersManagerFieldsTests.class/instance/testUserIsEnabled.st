as yet unclassified
testUserIsEnabled
	"comment stating purpose of message"

	admin password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.
	
	self assert: (admin isEnabled = true).