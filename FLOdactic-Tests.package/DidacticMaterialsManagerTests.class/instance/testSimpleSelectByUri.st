as yet unclassified
testSimpleSelectByUri
	""

	| result |
	self tearDown.
	self setUp.
	testmanager1 owner: testuser1 add: testmaterial1.
	testmanager1 owner: testuser1 add: testmaterial2.
	result := testmanager1 select: [:doc | doc filterUriEquals: 'http://www.albertdelafuente.com/doku.php/wiki/devel/python/ldap-auth'].
	
	self assert: ((result size) = 1).
	
