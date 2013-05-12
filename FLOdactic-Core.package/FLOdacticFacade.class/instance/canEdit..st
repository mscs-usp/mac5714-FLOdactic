testing
canEdit: anObject
	"Returns true if loggedUser can edit anObject
	anObject can be:
		- a DidacticMaterial instance in which case allowed user actors are:
			owner
			moderators
			administrators
		- an User instance in which case allowed user actors are:
			owner
			administrators
	Possible errors:
		User not logged in (nil)"

	| result isMaterial canDelete |
	result := false.
	canDelete := self canRemove: anObject. "handle errors"
	isMaterial := anObject class = DidacticMaterial.
	isMaterial ifTrue: [
		result := (anObject owner) username = loggedUser username.
		"Verify if loggedUser is a contributor"
		result ifFalse: [
			result := anObject matchesContributorsByUsername: (loggedUser username).
		].
	].
	result := (result) or: (canDelete).
	^ result.