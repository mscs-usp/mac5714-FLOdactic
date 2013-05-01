as yet unclassified
remove: aUsername
	"Removes from the structure aUsername. Raises errors on:
	- Non existing aUsername (verified with testEmptyUsername)"
	
	| user |
	(items includesKey: (aUsername username)) ifTrue: [
		Transcript show: ' exists on the system, removing it...'.
		user := items at: aUsername.
		emailsSet remove: (user email).
		items removeKey: aUsername.
	].
	[(items at: (aUsername username))] ifError: [
		Transcript show: ' doesnt exists on the system, cannot remove it...'.
		self error: 'Cannot remve that username, it doesnt exists!'

	].