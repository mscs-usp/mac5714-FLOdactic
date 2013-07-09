simulating
simulateRoutineOne
	"Routine 1: A User creates a new course and adds subjects to it. Then delegates control of the course to another user"
	|admin mainUser system topic course|
	
	admin := CourseUserRenamed withLogin: 'Pedros' password: 'senha' firstName: 'Pedro' lastName: 'Scocco'.
	mainUser := CourseUserRenamed withLogin: 'FabioKon' password: 'smalltalkS2' firstName: 'Fabio' lastName: 'Kon'.
	
 	system := CourseSystem withAdmin: admin.
 	topic := system createTopicWithName: 'Computação' creator: admin.
	
	course := topic createCourseWithName: 'BCC' creator: mainUser.
	
	course createSubjectWithName: 'Introdução a Computação' creator: mainUser.	
	
	course createSubjectWithName: 'Programação Orientada a Objetos' creator: mainUser.
	
	course addColaborator: admin.
	system explore.
	 ^ true