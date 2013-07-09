testing
canRemove: anObject
	"Returns true if loggedUser can remove anObject
	anObject can be:
		- a DidacticMaterial instance in which case allowed user actors are:
			owner
			moderators
			administrators
		- an User instance in which case allowed user actors are:
			owner (deletes it's own account)
			administrators
	Possible errors:
		User not logged in (nil)"

	| result isDidacticMaterial isUser isCourse |
	loggedUser ifNil: [ ^ false ].
	
	result := false.
	isDidacticMaterial := anObject class = DidacticMaterial.
	isDidacticMaterial ifTrue: [
		result := (anObject owner) username = loggedUser username.
		result ifFalse: [
			result := loggedUser isModerator.
		].
		result ifFalse: [
			result := loggedUser isAdmin.
		]
	].
	isCourse := anObject isKindOf: CourseUnit.
	isCourse ifTrue: [
		result := (anObject owner) username = loggedUser username.
		result ifFalse: [
			result := loggedUser isModerator.
		].
		result ifFalse: [
			result := loggedUser isAdmin.
		]
	].
	isUser := anObject class = User.
	isUser ifTrue: [
		result := (anObject username = loggedUser username) or: (loggedUser isAdmin).
	].
	^ result.