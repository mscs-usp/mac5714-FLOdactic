accessing
addCourse: aCourse
	"Adds a course. The owner will be the logged in user"
	
	| test |
	test := self loggedInOrRaiseErrorIfNot.
	test ifTrue: [
		aCourse touch.
		courses owner: loggedUser add: aCourse.
	]