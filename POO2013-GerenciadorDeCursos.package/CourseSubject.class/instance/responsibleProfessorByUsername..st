ownership and permissions
responsibleProfessorByUsername: aUsername
	| user  manager |
	manager := UsersManager singleton.
	
	"does it exist?"
	(manager items includesKey: aUsername) ifTrue: [
		user := manager items at: aUsername.
		responsibleProfessor := user ]
