as yet unclassified
testDuplicatedUserName
	"Test for duplicated usernames"

	| admin1 admin2 userManager |
	admin1 := User new.
	admin1 username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'leo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	admin2 := User new.
	admin2 username: 'admin'; password: 'q'; name: 'Rodrigo Barbosa'; email: 'rodrigo@flodactic.org'; role: 'administrator'; status: 'enabled'.

	userManager := UserManager new.
	userManager add: admin1.
	
	self should: [userManager add: admin2.] raise: Exception
