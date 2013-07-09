simulating
simulateRoutineAlbert
	"Routine 1: A User creates a new course and adds subjects to it. Then delegates control of the course to another user"
	|admin mainUser topic course primeiroDia subject turmaA intro cm |
	
	admin := User new.
	admin username: 'user'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; withAdminPrivileges; doEnable.

	mainUser := User new.
	mainUser username: 'user2'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; withAdminPrivileges; doEnable.
	
		
	topic := CourseTopic withName: 'Computação' creator: admin.
	
	course := CourseCourse withName: 'BCC' creator: admin.
	course description: 'B.S. C.S.'.

	subject := CourseSubject new.
	subject initializeWithCode: 'MAC5414' initializeWithName: 'Introdução a Computação' creator: admin.
	subject parent: course.	

	cm := CoursesManager new.
	cm validate: course.
	cm owner: admin addCourse: course.
	
	intro := CourseLesson withName: 'Introducao' creator: admin.
	intro parent: subject.
	
	turmaA := CourseClass withName: 'TurmaA' creator: admin.
	turmaA parent: subject.
	
	primeiroDia := CourseLesson withName: 'Introducao' creator: admin.
	primeiroDia parent: turmaA.
	
	course explore.
	 ^ true