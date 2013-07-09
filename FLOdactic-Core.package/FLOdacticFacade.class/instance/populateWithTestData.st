data-population
populateWithTestData

	| admin01 albertAuthor albertUser igorUser moderator01 moderator02 material01 material02 subject03 day02 |
	
	albertAuthor := Author new.
	albertAuthor name: 'Albert De La Fuente'.
	
	"Create special users objects"
	Transcript show: 'Creating users...'; crlf.
	admin01 := User new.
	moderator01 := User new.
	moderator02 := User new.
	
	admin01 username: 'admin01'; password: 'q'; name: 'Leonardo Santos'; email: 'admintest@flodactic.org'; withAdminPrivileges; doEnable.
	moderator01 username: 'mod01'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod01test@flodactic.org'; withModeratorPrivileges; doEnable.
	moderator02 username: 'mod02'; password: 'q'; name: 'Samuel Rodrigues'; email: 'mod02test@flodactic.org'; withModeratorPrivileges; doEnable.
	
	"Create regular users objects"
	albertUser := User new.
	igorUser := User new.
	
	albertUser username: 'albert'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; withUserPrivileges; doEnable.
	igorUser username: 'topcin'; password: 'q'; name: 'Igor Topcin'; email: 'topcin@ime.usp.br'; withUserPrivileges; doEnable.
	
	material01 := DidacticMaterial new.
	material02 := DidacticMaterial new.
	
	material01 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
		title: 'Python LDAP tutorial';
		description: 'A tutorial on how to use an LDAP server on Python';
		type: 'Internet Resource';
		license: 'Creative Commons';
		addTag: 'Python';
		addTag: 'Tutorial';
		addTag: 'LDAP';
		doEnable..

	material02 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/whatsapp-api';
		title: 'Python Whatsapp tutorial';
		description: 'A tutorial on how to use an Whatsapp API on Python';
		type: 'Internet Resource';
		license: 'Creative Commons';
		addTag: 'Python';
		addTag: 'Tutorial';
		addTag: 'Whatsapp';
		doEnable..
		
	material01 addAuthor: 'Albert'.
	material02 addAuthor: 'Albert'.

	"USERS POPULATION"
		
	self addUser: admin01.
	self addUser: moderator01.
	self addUser: moderator02.
	
	"LOGIN AS ADMIN01 AND POPULATE DATA"
	self doLogin: 'admin01' password: 'q'.
	
	self addUser: albertUser.
	self addUser: igorUser.
	
	"MATERIALS POPULATION"
	
	self addMaterial: material01.
	self addMaterial: material02.
	
	"COURSES POPULATION"
	
	course01 := CourseCourse new.
	course01 initializeWithCode: 'MAC' initializeWithName: 'B.S. Computer Science' creator: admin01.
	course01 title: 'B.S. Computer Science'.
	course01 description: 'Bachelor of Science in Computer Science course'; doEnable..
	course01 addColaboratorByUsername: 'albert'.
	course01 addTag: 'Computers'.
	course01 addTag: 'Electronics'.
	course01 addTag: 'Programming'.
	
	course02 := CourseCourse new.
	course02 initializeWithCode: 'MAT' initializeWithName: 'B. Mathematics' creator: admin01.
	course02 title: 'B.S. Mathematics'.
	course02 description: 'Bachelor of Mathematics'; doEnable..
	course02 addColaboratorByUsername: 'topcin'.
	course02 addTag: 'Mathematics'.
	course02 addTag: 'Calculus'.
	course02 addTag: 'Optimization'.

	"SUBJECTS POPULATION"

	subject01 := CourseSubject new.
	subject01 initializeWithCode: 'MAC5777' initializeWithName: 'Cool stuff in Python' creator: admin01.
	subject01 addDidacticMaterial: material01.
	subject01 addDidacticMaterial: material02.
	subject01 responsibleProfessorByUsername: 'albert'.
	subject01 parent: course01.
	subject01 description: 'A Python programming cool subject'; doEnable..
	subject01 workload: '6'.
	subject01 addTag: 'Python'.
	subject01 addColaboratorByUsername: 'topcin'.
	course01 children add: subject01 code -> subject01.
	
	subject02 := CourseSubject new.
	subject02 initializeWithCode: 'MAC5888' initializeWithName: 'N-plane complex futile stuff' creator: admin01.
	subject02 parent: course02.
	subject02 description: 'Test'; doEnable..
	subject02 responsibleProfessorByUsername: 'topcin'.
	subject02 addColaboratorByUsername: 'albert'.
	subject02 workload: '8'.
	course02 children add: subject02 code -> subject02.

	subject03 := CourseSubject new.
	subject03 initializeWithCode: 'MAC5999' initializeWithName: 'Best subject ever' creator: admin01.
	subject03 responsibleProfessorByUsername: 'topcin'.
	subject03 addColaboratorByUsername: 'albert'.
	subject03 parent: course02.
	subject03 description: 'Test'; doEnable..
	subject03 workload: '1'.
	course02 children add: subject03 code -> subject03.
	
	"CLASSES POPULATION"

	class01A := CourseClass new.
	class01A initializeWithCode: 'MAC5777-A' initializeWithName: 'Class A' creator: admin01.
	class01A instructorByUsername: 'albert'.
	class01A parent: subject01.
	class01A description: 'First group of MAC5777, to be held on class 256 (morning)'; doEnable..
	class01A startDate: '02/02/2013'.
	class01A endDate: '07/07/2013'.
	subject01 children add: class01A code -> class01A.
	
	class01B := CourseClass new.
	class01B initializeWithCode: 'MAC5777-B' initializeWithName: 'Class B' creator: admin01.
	class01B instructorByUsername: 'topcin'.
	class01B addColaboratorByUsername: 'albert'.
	class01B parent: subject01.
	class01B description: 'Second group of MAC5777, to be held on class 248 (afternoon)'; doEnable..
	class01B startDate: '06/06/2013'.
	class01B endDate: '09/09/2013'.
	subject01 children add: class01B code -> class01B.
	
	firstDay01 := CourseLesson new.
	firstDay01 initializeWithCode: 'MAC5777-A-01' initializeWithName: 'Lesson 01: Authenticating users using LDAP with Python' creator: admin01.
	firstDay01 addDidacticMaterial: material01.
	firstDay01 parent: class01A.
	firstDay01 description:'1st day of class, blah blah blah'; doEnable..
	firstDay01 date:  '02/02/2013'.
	class01A children add: firstDay01 code -> firstDay01.
	
	day02 := CourseLesson new.
	day02 initializeWithCode: 'MAC5777-A-02' initializeWithName: 'Lesson 02: Sending messages using the Python Whatsapp API' creator: admin01.
	day02 addDidacticMaterial: material02.
	day02 parent: class01A.
	day02 description: '2nd day of class, bleh bleh bleh'; doEnable..
	day02 date:  '02/03/2013'.
	class01A children add: day02 code -> day02.

	"FACADEPOPULATION"
	
	self addCourse: course01.
	self addCourse: course02.
