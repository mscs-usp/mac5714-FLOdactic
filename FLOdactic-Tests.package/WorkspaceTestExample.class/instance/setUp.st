as yet unclassified
setUp
	"Create the user's interface"
"	ui01 ifNotNil: [
		ui01 release.
	].
	ui02 ifNotNil: [
		ui02 release.
	].
	ui03 ifNotNil: [
		ui03 release.
	].
	ui04 ifNotNil: [
		ui04 release.
	]."

	Transcript show: 'Creating structures...'; crlf.
	ui01 := FLOdacticFacade new.
	ui02 := FLOdacticFacade new.
	ui03 := FLOdacticFacade new.
	ui04 := FLOdacticFacade new.	

	"Authors objects (these are not unique, they are treated as a stamp information on every document)"
	Transcript show: 'Creating authors...'; crlf.
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
	igorUser username: 'igor'; password: 'q'; name: 'Igor Topcin'; email: 'igor@ime.usp.br'; withUserPrivileges; doEnable.
	
	"didacticMaterialManager := DidacticMaterialsManager singleton."
	Transcript show: 'Creating didactic materials...'; crlf.
	material01 := DidacticMaterial new.
	material02 := DidacticMaterial new.
	
"	
	tagPython := Tag new; name: 'Python'.
	tagTutorial := Tag new; name: 'Tutorial'.
	tagLDAP := Tag new; name: 'Tutorial'.
	tagTutorial := Tag new; name: 'Tutorial'."
	
	material01 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
		title: 'Python LDAP tutorial';
		description: 'A tutorial on how to use an LDAP server on Python';
		type: 'document';
		license: 'cc';
		addAuthor: albertAuthor;
		addTag: 'Python';
		addTag: 'Tutorial';
		addTag: 'LDAP'.

	material02 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/whatsapp-api';
		title: 'Python Whatsapp tutorial';
		description: 'A tutorial on how to use an Whatsapp API on Python';
		type: 'document';
		license: 'cc';
		addTag: 'Python';
		addTag: 'Tutorial';
		addTag: 'Whatsapp'.
	
	"Create a SearchEngine"
	Transcript show: 'Creating search engine...'; crlf.
	floogle := SearchEngine new.
	
	"r1 := dm select: [:doc | ('*' match: doc title)].
	r2 := dm select: [:doc | ('*' match: doc title)]."

	"Create regular users objects"

