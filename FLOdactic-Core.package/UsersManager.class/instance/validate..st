as yet unclassified
validate: aUser
	"Validates the passed-in User and raises errors on:
	- empty username (verified with testEmptyUsername)
	- empty password (verified with testEmptyPassword)
	- empty email (verified with testEmptyEmail)
	- empty role (verified with testEmptyRole)
	- empty status (verified with testEmptyStatus)
	- repeated usernames (verified via items dictionary [test: testDuplicatedUsername])
	- repeated emails (verified via emailsMap [test: testDuplicatedEmails])
	"
	
	(aUser username) ifNil: [
		ValidationError signal: 'Username cannot be empty!'.
	].

	(aUser hasEmptyPassword) ifTrue: [
		ValidationError signal: 'Password cannot be empty Mr. genious!'.
	].

	(aUser name) ifNil: [
		ValidationError signal: 'Name cannot be empty!'.
	].

	(aUser email) ifNil: [
		ValidationError signal: 'Email cannot be empty!'.
	].

	(aUser role) ifNil: [
		ValidationError signal: 'Role cannot be empty!'.
	].

	(aUser status) ifNil: [
		ValidationError signal: 'Status cannot be empty oh oh!'.
	].

	(emailsMap includesKey: (aUser email)) ifTrue: [
		"There is a User with the same email!
		Checks if its not the same instance. Raise an error only if it's a different user"
		(aUser ~= (emailsMap at: (aUser email))) ifTrue: [
			ValidationError signal: 'A user with that email address already exists in the system!'.
		]
	].

	(items includesKey: (aUser username)) ifTrue: [
		"There is a User with the same username!
		Checks if its not the same instance. Raise an error only if it's a different user"
		(aUser ~= (items at: (aUser username))) ifTrue: [
			ValidationError signal: 'Cannot add that username, it already exists on the system. Did you forget the password? No cookies for you!'.
		]
	].
