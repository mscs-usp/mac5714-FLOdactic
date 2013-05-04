as yet unclassified
testAddWithAutomaticAttributes
	"Verifies if the created, modified and status attributes are filled automatically by the Manager"

	testmaterial1 uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
"	self should: [manager add: material.] raise: Exception"