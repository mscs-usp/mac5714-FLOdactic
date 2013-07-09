accessing
addContributorByUsername: aUsername
	"Adds a user to the contributors, granting with editor permissions"
	
	| user  manager |
	manager := UsersManager singleton.
	
	"does it exist?"
	(manager items includesKey: aUsername) ifTrue: [
		user := manager items at: aUsername.
		contributors add: aUsername name -> user ]