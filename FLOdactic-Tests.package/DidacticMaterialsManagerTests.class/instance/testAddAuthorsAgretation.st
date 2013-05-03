as yet unclassified
testAddAuthorsAgretation
	"Verifies if the created, modified and status attributes are filled automatically by the Manager"

	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
"	self should: [manager add: material.] raise: Exception"