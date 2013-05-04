as yet unclassified
testDidacticMaterialManagerCounterIncrementsAfterAddingADidacticMaterial
	"Verifies that after adding a material the number of materials gets incremented. It might be silly since the Dictionary class should be already tested by its developers"

	| user count |
	user := User new.
	user username: 'testowner'; email: 'testuser@flodactic.org'.
	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
	count  := manager size.
	manager owner: user add: material.
	self assert: ((manager size) = (count + 1)).