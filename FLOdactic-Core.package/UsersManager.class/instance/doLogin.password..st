accessing
doLogin: aUsernameString password: aPasswordString
	"Authenticates the user into the system.
	Returns true if username/password matches the ones provided, false if not.
	"
	| user |
	user := items select: [:userIterator | userIterator matchUsername: aUsernameString matchPassword: aPasswordString].