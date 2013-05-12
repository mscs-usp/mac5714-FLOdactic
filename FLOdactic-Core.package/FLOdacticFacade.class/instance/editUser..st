as yet unclassified
editUser: aNewUser
	"If the username matches and the user is logged in then we accept aNewUser as the updated object
	This is the best way we came arround to allow updates, we don't feel it would be nice to pass every
	property on the same message, so we pass a full object."

	| loggedIn matches user |
	loggedIn := self loggedInOrRaiseErrorIfNot.
	loggedIn ifTrue: [
		matches := (loggedUser username = aNewUser username) or: (self canEdit: aNewUser).
		matches ifTrue: [
			user := users items at: (aNewUser username).
			users items at: (aNewUser username) put: aNewUser.
		]
	]