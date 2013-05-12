as yet unclassified
setUp
	"Variables setup for the test"
	|user|
	
	testui := FLOdacticFacade newTestsInstance.
	
	user := User new.
	user username: 'albert'; password: 'pass'; name: 'Albert'; email: 'vonpupp@gmail.com'; withUserPrivileges; doEnable.
	testui addUser: user.
	
	user := User new.
	user username: 'john'; password: 'pwd1'; name: 'John Smith'; email: 'john@flodactic.org'; withUserPrivileges; doEnable.
	testui addUser: user.
	
	user := User new.
	user username: 'joane'; password: 'pwd2'; name: 'Joane Smith'; email: 'joane@flodactic.org'; withUserPrivileges; doEnable.
	testui addUser: user.
	
	user := User new.
	user username: 'bob'; password: 'pwd3'; name: 'Robert Williams'; email: 'bob@flodactic.org'; withUserPrivileges; doEnable.
	testui addUser: user.