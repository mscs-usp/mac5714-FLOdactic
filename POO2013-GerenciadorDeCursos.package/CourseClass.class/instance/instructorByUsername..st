time
instructorByUsername: aUsername
	| user  manager |
	manager := UsersManager singleton.
	
	"does it exist?"
	(manager items includesKey: aUsername) ifTrue: [
		user := manager items at: aUsername.
		instructor := user ]
