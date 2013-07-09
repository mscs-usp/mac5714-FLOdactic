accessing
toggleCourseStatus: aCourse
	self loggedInOrRaiseErrorIfNot.
	
	( self canEnable: aCourse ) ifFalse: [
		PermissionError signal: 'You do not have permission to enable this.' ].

	courses toggleEnable: aCourse.
