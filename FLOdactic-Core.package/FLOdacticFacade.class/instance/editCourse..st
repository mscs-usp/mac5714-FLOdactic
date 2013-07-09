accessing
editCourse: aCourse
	self loggedInOrRaiseErrorIfNot.
	
	( self canEdit: aCourse ) ifFalse: [
		PermissionError signal: 'You do not have permission to update this.' ].

	courses owner: loggedUser edit: aCourse.
