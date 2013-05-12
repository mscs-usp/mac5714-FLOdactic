initialize-release
remove: aUsername
	"Removes from the structure aUsername. Raises errors on:
	- Non existing aUsername (verified with testEmptyUsername)"
	
	| user |
	Transcript show: 'Removing *', aUsername, '* from the database'; crlf.
	
	user := items at: aUsername ifAbsent: [
		self error: 'The user does not exists on the system, cannot remove it...'.
		^ self
	].

	items removeKey: aUsername.
	emailsMap removeKey: (user email) ifAbsent: [].
