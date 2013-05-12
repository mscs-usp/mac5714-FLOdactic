as yet unclassified
canEnable: anObject
	"Returns true only if loggedUser can enable anObject
	anObject can be:
		- a DidacticMaterial instance in which case allowed user actors are:
			administrators
		- an User instance in which case allowed user actors are:
			administrators
	Possible errors:
		User not logged in (nil)"

	| result |
	result := self checkLoggedInOrError.
	result := loggedUser isAdmin.
	^ result.