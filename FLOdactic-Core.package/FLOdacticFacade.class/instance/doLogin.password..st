as yet unclassified
doLogin: aUsernameString password: aPasswordString
	"Performs the login to the system.
	Returns true if login was successfull, false if not
	Possible errors:
	- Already logged in
	- Wrong username or username doesn't exist (delegated to UsersManager class)
	- Wrong password (delegated to UsersManager class)
	- User disabled (delegated to UsersManager class)
	"

	| result msg error |
	
	error := false.
	loggedUser ifNil: [
		loggedUser := users doLogin: aUsernameString password: aPasswordString.
		msg := 'Welcome back to FLOdactic', aUsernameString.
	]
	ifNotNil: [
		msg := 'Someone is already loggedin, logoff if this is not you!'.
		error := true.
	].
	result := loggedUser username = aUsernameString.
	Transcript show: msg; cr.
	error ifTrue: [
		PermissionError signal: msg.
	].
	^ result.
	
