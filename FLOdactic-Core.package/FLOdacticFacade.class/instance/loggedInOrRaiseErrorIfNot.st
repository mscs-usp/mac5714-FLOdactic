testing
loggedInOrRaiseErrorIfNot
	"Checks if the user is logged in, and if not raises an error"

	| msg test |
	test := loggedUser = nil.
	test ifTrue: [ 
		msg := 'Not logged in, you must log in first in order to complete that action. No cookies for you my friend!'.
		PermissionError signal: msg
	].
	^ test not.