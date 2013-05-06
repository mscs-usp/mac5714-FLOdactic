as yet unclassified
testSimpleSelectByLicense
	""

	| result |
	self tearDown.
	self setUp.
	testmanager1 owner: testuser1 add: testmaterial1.
	testmanager1 owner: testuser1 add: testmaterial2.
	testmanager1 owner: testuser1 add: testmaterial3.
	result := testmanager1 select: [:doc | doc license = 'GPLv2'].
	
	self assert: ((result size) = 1).
	
