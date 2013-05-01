as yet unclassified
add: anUser
	"Adds an user to the structure. Raises errors on:
	- empty username
	- empty password
	- empty email
	- empty role
	- empty status
	- repeated usernames (verified via dictionary [test: UserTests:testDuplicatedUsername])
	- repeated emails
	"
	(items includesKey: (anUser username)) ifTrue: [
		Transcript show: ' already exists on the system'.
		self error: 'Cannot add that username, it already exists on the system. Did you forget the password? No cookies for you!'
	].
	[(items at: (anUser username))] ifError: [
		items add: (anUser username) -> anUser.
		"emailsSet add: (anUser email)."
		Transcript show: ' doesnt exists on the system, adding it...'.
	].
	.