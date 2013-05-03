as yet unclassified
doLogin: aUsernameString password: aPasswordString
	"comment stating purpose of message"

	| result |
	loggedUser := users doLogin: aUsernameString password: aPasswordString.
	result := loggedUser ~= nil.
	^ result.