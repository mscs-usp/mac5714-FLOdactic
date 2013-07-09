as yet unclassified
go
	"Starts off the profile editting process"
	self session loggedUser ifNil: [ 
		self redirectToDefaultPage ].
	[ self showUserForm ] whileFalse.
	self showSuccessMessage.