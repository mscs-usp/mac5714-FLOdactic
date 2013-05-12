as yet unclassified
add: aUser
	"Adds a user to the structure.
	* Test class: UserTests
	"
	self validate: aUser.
	
	items add: (aUser username) -> aUser.
	emailsMap add: (aUser email) -> aUser.
	Transcript show: 'The user doesnt exists on the system, adding it...'; crlf.

