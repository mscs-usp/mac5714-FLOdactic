as yet unclassified
testRemoveWithNonExistingUsername
	"comment stating purpose of message"

	user password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; withAdminPrivileges; doEnable.
	
	self should: [usersManager remove: 'aasdasda'.] raise: Error