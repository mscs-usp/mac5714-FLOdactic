as yet unclassified
setUp
	"Variables setup for the test"
	
	| user |
	
	testui := FLOdacticFacade new.
	user := User new.
	user username: 'albert'; password: 'pass'; name: 'Albert'; email: 'vonpupp@gmail.com'; role: 'user'; status: 'enabled'.
	testui addUser: user.