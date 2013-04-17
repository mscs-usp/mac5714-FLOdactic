instance creation
uri: aUriString owner: aUser
	"Designated constructor for this class"

	^ self basicNew
			initializeWithUri: aUriString owner: aUser;
			yourself.