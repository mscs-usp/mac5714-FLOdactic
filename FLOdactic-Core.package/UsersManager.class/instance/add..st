as yet unclassified
add: anUser
	"Adds an user to the structure. Raises errors on:
	- empty username (verified with testEmptyUsername)
	- empty password (verified with testEmptyPassword)
	- empty email (verified with testEmptyEmail)
	- empty role (verified with testEmptyRole)
	- empty status (verified with testEmptyStatus)
	- repeated usernames (verified via items dictionary [test: testDuplicatedUsername])
	- repeated emails (verified via emailsSet [test: testDuplicatedEmails])
	* Test class: UserTests
	"
	
	| msg error test |
	
	error := false.
	msg := ''.
	(anUser username) ifNil: [
		msg := 'Username cannot be empty!'.
		error := true.
	].
	(anUser hasEmptyPassword) ifTrue: [
		msg := 'Password cannot be empty Mr. genious!'.
		error := true.
	].
	(anUser name) ifNil: [
		msg := 'Name cannot be empty!'.
		error := true.
	].
	(anUser email) ifNil: [
		msg := 'Email cannot be empty!'.
		error := true.
	].
	(anUser role) ifNil: [
		msg := 'Role cannot be empty!'.
		error := true.
	].
	(anUser status) ifNil: [
		msg := 'Status cannot be empty oh oh!'.
		error := true.
	].
	(emailsSet includes: (anUser email)) ifTrue: [
		msg := 'Cannot add that username, its email address already exists on the system!'.
		error := true.
	].
	test := items includesKey: (anUser username).
	(test) ifTrue: [
		msg := 'Cannot add that username, it already exists on the system. Did you forget the password? No cookies for you!'.
		error := true.
	].
	(test) ifFalse: [
		items add: (anUser username) -> anUser.
		emailsSet add: (anUser email).
		msg := 'The user doesnt exists on the system, adding it...'.
	].
	Transcript show: msg; crlf.
	(error) ifTrue: [
		self error: msg.
	].