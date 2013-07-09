as yet unclassified
initialize
	super initialize.
	menu := Array 
		with: 'Users' -> FLOUsersListComponent
		with: 'Materials' -> FLOMaterialsListComponent
		with: 'Course' -> FLOCoursesListComponent
		with: 'Populate w/test data' -> FLOPopulateComponent.
	pages := Dictionary new
		add: (self pathFor: FLOUsersListComponent title) -> FLOUsersListComponent;
		add: (self pathFor: FLOMaterialsListComponent title) -> FLOMaterialsListComponent;
		add: (self pathFor: FLOCoursesListComponent title) -> FLOCoursesListComponent;
		add: (self pathFor: FLOEditUserTask title) -> FLOEditUserTask;
		add: (self pathFor: FLOUserSignUpTask title) -> FLOUserSignUpTask;
		yourself.

	defaultPage := FLOCoursesListComponent.
	currentPage := defaultPage new
