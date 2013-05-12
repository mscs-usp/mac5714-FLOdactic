testing
checkLoggedInOrError
	"comment stating purpose of message"

	| result |
	result := loggedUser ~= nil.
	result ifFalse: [
		self error: 'You might wanna log in fist buddy'.
	].
	^ result.