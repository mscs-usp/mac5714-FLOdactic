as yet unclassified
testWorkspace
	"This is an example of a possible use case of FLOdactic."

	| rawSearch search rawSearch1 rawSearch2 |

	"Add special users to the session"
	ui01 addUser: admin01.
	ui01 addUser: moderator01.
	ui01 addUser: moderator02.
	
	ui01 addUser: albertUser.
	ui01 doLogin: 'albert' password: 'q'.
	ui01 loggedUser.

	ui01 addMaterial: material01.
	ui01 addMaterial: material02.
	
	self assert: ((material01 matchesByOwnerName: 'Albert De La Fuente') = true).	
	self assert: ((albertUser isUser) = true).
	self assert: ((albertUser isDisabled) = false).

	floogle := SearchEngine new.
	rawSearch := floogle searchDidacticMaterials: 'Python'.
	
	search := floogle addFilter: (Filter didacticMaterialsByAuthorName: 'Albert De La Fuente').
	self assert: ((search size) = 1).
	
	floogle := SearchEngine new.
	rawSearch := floogle searchDidacticMaterials: 'Python'.
	

	search := floogle addFilter: (Filter didacticMaterialsByDescription: 'tutorial').
	self assert: ((search size) = 2).

	search := floogle addFilter: (Filter didacticMaterialsByStatus: 'enabled').
	self assert: ((search size) = 2).
	
	search := floogle addFilter: (Filter didacticMaterialsByStatus: 'enabled').
	self assert: ((search size) = 2).

	search := floogle addFilter: (Filter didacticMaterialsByTitle: 'Python').
	self assert: ((search size) = 2).

	search := floogle addFilter: (Filter didacticMaterialsByType: 'document').
	self assert: ((search size) = 2).
	
	search := floogle addFilter: (Filter didacticMaterialsByTag: 'Python').
	self assert: ((search size) = 2).
	
	"r1 := dm select: [:doc | ('*' match: doc title)].
	r2 := dm select: [:doc | ('*' match: doc title)]."

	"Add them to the FLOdactic User's Interface"
	
	"albert is logged in ui01"
	self assert: ((ui01 canRemove: albertUser) = true).
	self assert: ((ui01 canEdit: albertUser) = true).
	"The user can edit / delete it's own materials"
	self assert: ((ui01 canRemove: material01) = true).
	"Users cannot block users nor materials"
	self assert: ((ui01 canEdit: material01) = true).
	self assert: ((ui01 canDisable: albertUser) = false).
	self assert: ((ui01 canDisable: material01) = false).
	self assert: ((ui01 canDisable: igorUser) = false).

	ui02 doLogin: 'admin01' password: 'q'.
	"admin01, is logged in ui01. who can also edit / delete any user and document"
	self assert: ((ui02 canRemove: albertUser) = true).
	self assert: ((ui02 canEdit: albertUser) = true).
	self assert: ((ui02 canRemove: material01) = true).
	self assert: ((ui02 canEdit: material01) = true).
	"Only administrators can block users and didactic materials"
	self assert: ((ui02 canDisable: albertUser) = true).
	self assert: ((ui02 canDisable: material01) = true).
		
	ui03 doLogin: 'mod01' password: 'q'.
	"moderator01, is logged in ui03. who can also edit / delete any document, but not user"
	self assert: ((ui03 canRemove: albertUser) = false).
	self assert: ((ui03 canEdit: albertUser) = false).
	self assert: ((ui03 canRemove: material01) = true).
	self assert: ((ui03 canEdit: material01) = true).
	"Moderators can block only didactic materials"
	self assert: ((ui03 canDisable: albertUser) = false).
	self assert: ((ui03 canDisable: material01) = true).
	
	ui04 addUser: igorUser.
	ui04 doLogin: 'igor' password: 'q'.
	"This is a regular user (who's not the user itself), he can't edit / delete"
	self assert: ((ui04 canRemove: albertUser) = false).
	self assert: ((ui04 canEdit: albertUser) = false).
	"This user cannot edit / delete material01, since albert haven't yet authorized to do so"	
	self assert: ((ui04 canRemove: material01) = false).
	self assert: ((ui04 canEdit: material01) = false).

	"Permission granted as contributor"	
	ui01 addContributor: igorUser didacticMaterial: material02.
	self assert: ((material02 matchesContributorsByName: 'Igor Topcin') = false).
	
	"This is a regular user (who's not the user itself), he can't edit / delete"
	self assert: ((ui04 canRemove: albertUser) = false).
	self assert: ((ui04 canEdit: albertUser) = false).
	self assert: ((ui04 canDisable: albertUser) = false).
	"This user now can edit but not delete material01, since albert has authorized to do so"	
	self assert: ((ui04 canRemove: material02) = false).
	self assert: ((ui04 canEdit: material02) = true).
	self assert: ((ui04 canDisable: material02) = false).

	"Igor is editing Alberts material"
	Transcript show: 'Igor is editing Alberts material';cr.
"	material02Edited := material02 deepCopy."
	material02 addAuthor: 'Albert De La Fuente'.
	ui04 editDidacticMaterial: material02.

	"Search by author's name"	
	rawSearch := floogle searchDidacticMaterials: '*'.
	search := floogle addFilter: (Filter didacticMaterialsByAuthorName: 'Albert De La Fuente').
	self assert: ((search size) = 2).
	
	"Let's edit (update) the user's email address"
	albertUser username: 'albert'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; withUserPrivileges; doEnable.
	ui01 editUser: albertUser.
	self assert: ((ui01 loggedUser email) = 'albert@ime.usp.br').

	"Search a didactic material by the owner's name"
	rawSearch := floogle searchDidacticMaterials: '*'.
	search := floogle addFilter: (Filter didacticMaterialsByOwnerName: 'Albert').
	self assert: ((rawSearch size) = 2).
	
	"Search a didactic material by the owner's email"
	rawSearch := floogle searchDidacticMaterials: '*'.
	search := floogle addFilter: (Filter didacticMaterialsByOwnerEmail: 'albert@ime.usp.br').
	self assert: ((rawSearch size) = 2).
	
	"Search all users"
	rawSearch := floogle searchUsers: '*'.
	self assert: ((rawSearch size) >= 5).
	
	"Filter only administrators"
	search := floogle addFilter: (Filter usersByRole: 'administrator').
	self assert: ((search size) >= 1).
	
	"Filter only regular users"
	search := floogle addFilter: (Filter usersByRole: 'user').
	self assert: ((search size) >= 2).

	"Igor tries to remove the didactic material (why!!!!?)"
	rawSearch1 := floogle searchDidacticMaterials: '*'.
	ui04 removeDidacticMaterial: material02.
	rawSearch2 := floogle searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size)).

	rawSearch1 := ui04 searchDidacticMaterials: '*'.
	
	"Igor reports for removal to the moderators"
	self assert: ((material02 isBlocked) = false).
	ui04 feedbackBlock: material02.
	self assert: ((material02 isBlocked) = true).
	self assert: ((material02 isEnabled) = false).
	self assert: ((material02 status) = 'blocked').
	
	"Moderator mod01 disables material02, we counted the
	number of items in rawSearch1 before Igor's request (see 5 lines before)"
	ui03 feedbackDisable: material02.
	self assert: ((material02 isDisabled) = true).
	rawSearch2 := ui04 searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).

	"Enable back a material. Only admins can do that"
	rawSearch2 := ui04 searchDidacticMaterials: '*'. "Igor's count"	
	ui02 feedbackEnable: material02.
	rawSearch1 := ui04 searchDidacticMaterials: '*'. "Igor's count"	
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).
	
	"Moderator mod01 removes the didactic material"
	rawSearch1 := floogle searchDidacticMaterials: '*'.
	ui03 removeDidacticMaterial: material02.
	rawSearch2 := floogle searchDidacticMaterials: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).

	"Albert reports Igor"	
	self assert: ((igorUser isBlocked) = false).
	ui04 feedbackBlock: igorUser.
	self assert: ((igorUser isBlocked) = true).
	
	"Admin disables Igor"
	ui02 feedbackDisable: igorUser.
	self assert: ((igorUser isDisabled) = true).

	ui04 doLogout.
	self should: [ui04 doLogin: 'igor' password: 'q'] raise: PermissionError.

	"Administrator removes Igor"
	rawSearch1 := floogle searchUsers: '*'.
	ui02 removeUser: 'igor'.
	rawSearch2 := floogle searchUsers: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).
	
	"And Albert too"
	rawSearch1 := floogle searchUsers: '*'.
	ui02 removeUser: 'albert'.
	rawSearch2 := floogle searchUsers: '*'.
	self assert: ((rawSearch1 size) = (rawSearch2 size + 1)).

"OTHER TESTS FROM IMPORTED IMPORTED COMPONENTS, WE SHOULDN'T BE DOING THIS!!"
	
	ui01 addUser: albertUser.
"	ui01 doLogin: 'albert' password: 'q'."
	ui01 loggedUser.

	ui01 addMaterial: material01.
	ui01 addMaterial: material02.
	
	"COURSES POPULATION"
	
	course01 := CourseCourse new.
	course01 initializeWithCode: 'MAC' initializeWithName: 'B.S. Computer Science' creator: admin01.
"		addTag: 'Python';
		addTag: 'Tutorial';
		addTag: 'Whatsapp'."
	course01 title: 'B.S. Computer Science'.
	course01 description: 'Bachelor of Science in Computer Science course'; doEnable..	

	course02 := CourseCourse new.
	course02 initializeWithCode: 'MAT' initializeWithName: 'B. Mathematics' creator: admin01.
	course02 title: 'B.S. Mathematics'.
	course02 description: 'Bachelor of Mathematics'; doEnable..

	"SUBJECTS POPULATION"

	subject01 := CourseSubject new.
	subject01 initializeWithCode: 'MAC5777' initializeWithName: 'Cool stuff in Python' creator: admin01.
	subject01 parent: course01.
	
	subject02 := CourseSubject new.
	subject02 initializeWithCode: 'MAC5888' initializeWithName: 'N-plane complex futile stuff' creator: admin01.
	subject02 parent: course02.
	
	"CLASSES POPULATION"

	class01A := CourseClass withName: 'Class A' creator: admin01.
	class01A parent: subject01.
	
	class01B := CourseClass withName: 'Class B' creator: admin01.
	class01B parent: subject01.
	
	firstDay01 := CourseLesson withName: 'Python LDAP Auth' creator: admin01.
	firstDay01 parent: class01A.

	"FACADEPOPULATION"
	
	ui01 addCourse: course01.
	ui01 addCourse: course02.

	"LOGOUT"
	
	rawSearch := floogle searchCourses: 'Mathematics'.
	self assert: ((rawSearch size) = 1).