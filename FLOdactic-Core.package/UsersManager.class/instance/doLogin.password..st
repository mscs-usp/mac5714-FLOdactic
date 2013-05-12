accessing
doLogin: aUsernameString password: aPasswordString
	"Authenticates the user into the system.
	Returns true if username/password matches the ones provided, false if not.
	Possible errors:
	- Username missmatch. Test: testDoLoginWithNonExistingUsername
	- Password missmatch. Test: testDoLoginWithWrongPassword
	- User is disabled. Test:
	"
	| user test acceptedAuth msg error |
	user := nil.
	test := items includesKey: aUsernameString.
	(test) ifFalse: [
		msg := 'User doesnt exist'.
		error := true.
	].
	(test) ifTrue: [
		user := items at: aUsernameString.
		error := false.
		acceptedAuth := user matchUsername: aUsernameString matchPassword: aPasswordString.
		acceptedAuth ifFalse: [
			msg := 'Wrong password. No cookies for you!'.
			error := true.
		].
		acceptedAuth ifTrue: [
			acceptedAuth := acceptedAuth and: user isEnabled.
			acceptedAuth ifFalse: [
				msg := 'The user is disabled, you cannot login.'.
				error := true.
			].
			acceptedAuth ifTrue: [
				msg := 'User loged in'.
			].
		].
	].
	Transcript show: msg; cr.
	(error) ifTrue: [
		PermissionError signal: msg.
	].
	^ user.