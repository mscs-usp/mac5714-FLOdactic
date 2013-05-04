as yet unclassified
remove: aUsername
	"Removes from the structure aUsername. Raises errors on:
	- Non existing aUsername (verified with testEmptyUsername)"
	
	| user test msg |
	test := items includesKey: aUsername.
	(test) ifTrue: [
		msg := 'The user exists on the system, removing it...'.
		Transcript show: msg; crlf.
		user := items at: aUsername.
		emailsSet remove: (user email).
		items removeKey: aUsername.
	].
	(test) ifFalse: [
		msg := 'The user doesnt exists on the system, cannot remove it...'.
		Transcript show: msg; crlf.
		self error: msg

	].