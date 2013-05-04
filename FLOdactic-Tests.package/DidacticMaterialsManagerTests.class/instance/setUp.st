as yet unclassified
setUp
	"Variables setup for the test"
	
	testuser1 := User new.
	testuser1 username: 'user1'; password: 'q'; name: 'user1'; email: 'user1@flodactic.org'; role: 'user'; status: 'enabled'.
	testuser2 := User new.
	testuser2 username: 'user2'; password: 'q'; name: 'user2'; email: 'user2@flodactic.org'; role: 'user'; status: 'enabled'.

	testmaterial1 := DidacticMaterial new.
	testmaterial2 := DidacticMaterial new.
	testmaterial1 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
			title: 'title';
			description: 'description';
			type: 'type';
			license: 'license'.
	testmaterial2 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/whatsapp-api';
			title: 'title';
			description: 'description';
			type: 'type';
			license: 'license'.

	testmanager1 := DidacticMaterialsManager new.