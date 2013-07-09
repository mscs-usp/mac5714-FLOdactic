accessing
editUser: aNewUser
	"If the username matches and the user is logged in then we accept aNewUser as the updated object
	This is the best way we came arround to allow updates, we don't feel it would be nice to pass every
	property on the same message, so we pass a full object."

	self loggedInOrRaiseErrorIfNot.
	
	( self canEdit: aNewUser ) ifFalse: [
		PermissionError signal: 'You do not have permission to update this didactic material.' ].

	users save: aNewUser