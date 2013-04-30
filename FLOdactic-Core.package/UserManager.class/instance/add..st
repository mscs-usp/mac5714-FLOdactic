accessing
add: anUser
	"Raises an error if the user already exists, else it will be added to the structure"
	(items includesKey: (anUser username)) ifTrue: [
		Transcript show: ' already exists on the system'.
		self error: 'Cannot add that username, it already exists on the system. Did you forget the password? No cookies for you!'
	].
	[(items at: (anUser username))] ifError: [
		items add: (anUser username) -> anUser.
		Transcript show: ' doesnt exists on the system, adding it...'.
	].
	.