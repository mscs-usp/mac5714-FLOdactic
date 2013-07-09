testing
validate: aUser forExistingKey: existingUsername
	"Validates the passed-in User. If the User already exists in the database, the 'existingUsername' argument should be also informed; otherwise it should be nil.
	Raises errors on:
	- empty username (verified with testEmptyUsername)
	- empty password (verified with testEmptyPassword)
	- empty email (verified with testEmptyEmail)
	- empty role (verified with testEmptyRole)
	- empty status (verified with testEmptyStatus)
	- repeated usernames (verified via items dictionary [test: testDuplicatedUsername])
	- repeated emails (verified via emailsMap [test: testDuplicatedEmails])
	"
	
	(aUser username) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Username cannot be empty!'.
	].

	(aUser hasEmptyPassword) ifTrue: [
		ValidationError signal: 'Password cannot be empty Mr. genious!'.
	].

	(aUser name) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Name cannot be empty!'.
	].

	(aUser email) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Email cannot be empty!'.
	].

	(aUser role) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Role cannot be empty!'.
	].

	(aUser status) isEmptyOrNil ifTrue: [
		ValidationError signal: 'Status cannot be empty oh oh!'.
	].

	(existingUsername ~= nil) ifTrue: [	
		(emailsMap includesKey: (aUser email)) ifTrue: [
			"There is a User with the same email!
			Checks if its not the same user. Raise an error only if it's a different user"
			(existingUsername  ~= ((emailsMap at: aUser email) username)) ifTrue: [
				ValidationError signal: 'A user with that email address already exists in the system!'.
			]
		].

		(items includesKey: (aUser username)) ifTrue: [
			"There is a User with the same username!
			Checks if its not the same user. Raise an error only if it's a different user"
			(existingUsername ~= aUser username) ifTrue: [
				ValidationError signal: 'Cannot add that username, it already exists on the system. Did you forget the password? No cookies for you!'.
			].
		].
	]
