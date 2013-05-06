as yet unclassified
testNestedSelectByTitleContains
	""

	| select1 select2 |
	self tearDown.
	self setUp.
	testmanager1 owner: testuser1 add: testmaterial1.
	testmanager1 owner: testuser1 add: testmaterial2.
	select1 := testmanager1 select: [:doc | (doc title findString: 'Python') > 0].
	self assert: ((select1 size) = 2).
	
	select2 := select1 select: [:doc | (doc title findString: 'Whatsapp') > 0].
	self assert: ((select2 size) = 1).
	
