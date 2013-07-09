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

	| result isMaterial canDelete isCourse |
	loggedUser ifNil: [ ^ false ].
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
	isCourse := anObject isKindOf: CourseUnit.
	isCourse ifTrue: [
		result := (anObject owner) username = loggedUser username.
		"Verify if loggedUser is a contributor"
		result ifFalse: [
			result := anObject matchesContributorsByUsername: (loggedUser username).
		].
	].
	result := (result) or: (canDelete) or: (loggedUser isAdmin).
	^ result.