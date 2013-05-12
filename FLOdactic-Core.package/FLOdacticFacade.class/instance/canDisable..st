testing
canDisable: anObject
	"Returns true only if loggedUser can disable anObject
	anObject can be:
		- a DidacticMaterial instance in which case allowed user actors are:
			moderators
			administrators
		- an User instance in which case allowed user actors are:
			administrators
	Possible errors:
		User not logged in (nil)"

	| result isDidacticMaterial isUser |
	result := self checkLoggedInOrError.
	result := false.
	isDidacticMaterial := anObject class = DidacticMaterial.
	isDidacticMaterial ifTrue: [
		result := (loggedUser isAdmin) or: (loggedUser isModerator).
	].
	isUser := anObject class = User.
	isUser ifTrue: [
		result := loggedUser isAdmin.
	].
	^ result.