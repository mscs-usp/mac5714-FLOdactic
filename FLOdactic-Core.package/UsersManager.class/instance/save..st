accessing
save: aUserCopy
	"Saves a user to the structure"
	| user |
	
	(items includesKey: aUserCopy username) ifFalse: [
		ValidationError signal: 'The user you are trying to update does not exist' ].
	
	self validate: aUserCopy forExistingKey: aUserCopy username.
	
	user := items at: aUserCopy username.
	user copyFrom: aUserCopy.
	
	Transcript show: 'Updating existing user...'; crlf.
