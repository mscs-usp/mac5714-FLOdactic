as yet unclassified
initialize
	super initialize.
	user := self session loggedUser deepCopy.
	updatePassword := false