as yet unclassified
testWorkspace
	"This is an example of a possible use flow of FLOdactic."

	| admin mod01 mod02 albert igor ui ldapDocument |
	
	"Create the user's interface"
	ui := FLOdacticFacade new.
	
	"Create special users objects"
	admin := User new.
	admin username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
	mod01 := User new.
	mod01 username: 'mod01'; password: 'q'; name: 'Rodolpho Bustamante'; email: 'mod01@flodactic.org'; role: 'moderator'; status: 'enabled'.
	mod02 := User new.
	mod02 username: 'mod02'; password: 'q'; name: 'Samuel Rodrigues'; email: 'mod02@flodactic.org'; role: 'moderator'; status: 'enabled'.

	"Add them to the FLOdactic User's Interface"
	ui addUser: admin.
	ui addUser: mod01.
	ui addUser: mod02.

	"Create regular users objects"
	albert := User new.
	albert username: 'albert'; password: 'q'; name: 'Albert De La Fuente'; email: 'albert@ime.usp.br'; role: 'user'; status: 'enabled'.
	igor := User new.
	igor username: 'topcin'; password: 'q'; name: 'Igor Topcin'; email: 'topcin@ime.usp.br'; role: 'user'; status: 'enabled'.

	"Add them to the FLOdactic User's Interface"
	ui addUser: albert.
	ui addUser: igor.
	
	ui doLogin: 'albert' password: 'q'.
	ldapDocument username: 'admin'; password: 'q'; name: 'Leonardo Santos'; email: 'admin@flodactic.org'; role: 'administrator'; status: 'enabled'.
"	ui addMaterial: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'"