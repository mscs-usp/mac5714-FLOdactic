accessing
doLogin: aUser

	aUser
		ifNil: [ PermissionError signal: 'Please login with a valid user' ]
		ifNotNil: [ loggedUser := aUser ]
	
