as yet unclassified
testDidacticMaterialManagerCounterIncrementsAfterAddingADidacticMaterial
	"Verifies that after adding a material the number of materials gets incremented. It might be silly since the Dictionary class should be already tested by its developers"

	| count |
"	user := User new.
	user username: 'testowner'; email: 'testuser@flodactic.org'.
	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'."

	count  := testmanager1 size.
	testmanager1 owner: testuser1 add: testmaterial1.
"	testmanager1 owner: testuser1 add: testmaterial2."
	self assert: ((testmanager1 size) = (count + 1)).