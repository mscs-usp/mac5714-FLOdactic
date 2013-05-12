as yet unclassified
testSelectAuthorsByName
	"Albert is author of 3 materials and Igor is author of 1"

	| result |
	self tearDown.
	self setUp.
	testmanager1 owner: testuser1 add: testmaterial1.
	testmanager1 owner: testuser1 add: testmaterial2.
	testmanager1 owner: testuser1 add: testmaterial3.
	
	result := testmaterial1 selectAuthorsByName: 'Albert De La Fuente'.
	self assert: ((result size) = 1).
	result := testmaterial3 selectAuthorsByName: 'Igor Topcin'.
	self assert: ((result size) = 1).