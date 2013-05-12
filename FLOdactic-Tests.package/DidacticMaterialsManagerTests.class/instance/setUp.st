as yet unclassified
setUp
	"Variables setup for the test"
	
	author1 := Author new.
	author1 name: 'Albert De La Fuente'.
	author2 := Author new.
	author2 name: 'Igor Topcin'.
	testuser1 := User new.
	testuser1 username: 'user1'; password: 'q'; name: 'user1'; email: 'user1@flodactic.org'; withUserPrivileges; doEnable..
	testuser2 := User new.
	testuser2 username: 'user2'; password: 'q'; name: 'user2'; email: 'user2@flodactic.org'; withUserPrivileges; doEnable...

	testmaterial1 := DidacticMaterial new.
	testmaterial1 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth';
			title: 'Python LDAP tutorial';
			description: 'A tutorial on how to use an LDAP server on Python';
			type: 'document';
			license: 'cc';
			addAuthor: author1.
			
	testmaterial2 := DidacticMaterial new.
	testmaterial2 uri: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/whatsapp-api';
			title: 'Python Whatsapp tutorial';
			description: 'A tutorial on how to use an Whatsapp API on Python';
			type: 'document';
			license: 'cc-ca';
			addAuthor: author1.
			
	testmaterial3 := DidacticMaterial new.
	testmaterial3 uri: 'https://github.com/poo2013pos/FLOdactic';
			title: 'FLOdactic: A Free Libre Open didactic management system';
			description: 'A Free Libre Open didactic management system made in Smalltalk for the 2013 OOP course at Universidade de Sao Paulo';
			type: 'Source Code';
			license: 'GPLv2';
			addAuthor: author1;
			addAuthor: author2.

	testmanager1 := DidacticMaterialsManager new.