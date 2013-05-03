as yet unclassified
testAddWithEmptyType
	"comment stating purpose of message"

	material uri: 'uri'; title: 'title'; description: 'description'; license: 'license'.
	
	self should: [manager add: material.] raise: Exception