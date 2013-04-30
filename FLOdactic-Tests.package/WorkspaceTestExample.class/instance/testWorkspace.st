as yet unclassified
testWorkspace
	"This is not really a test, is a 'persistent workspace' in order to be able to use it over git"

	| admin mod01 mod02 albert igor userManager |
	
	"Create special users objects"
	admin := User new.
	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	mod01 := User new.
	mod01 username: 'mod01'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod01@flodactic.org'; role: 'moderator'; status: 'enabled'.
	mod02 := User new.
	mod02 username: 'mod02'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod02@flodactic.org'; role: 'moderator'; status: 'enabled'.

	"Create regular users objects"
	albert := User new.
	albert username: 'vonpupp'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; role: 'user'; status: 'enabled'.
	igor := User new.
	igor username: 'topcin'; password: 'q'; name: 'Igor Topcin'; email: 'topcin@ime.usp.br'; role: 'user'; status: 'enabled'.

	"Add them to the system"
	userManager := UserManager new.
	userManager add: mod01.
	userManager add: mod02.
	userManager add: albert.
	userManager add: igor.