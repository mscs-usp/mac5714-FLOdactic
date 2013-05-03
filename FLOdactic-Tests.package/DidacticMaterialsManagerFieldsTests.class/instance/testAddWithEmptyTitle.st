as yet unclassified
testAddWithEmptyTitle
	"comment stating purpose of message"

	material uri: 'uri'; description: 'description'; type: 'type'; license: 'license'.
	
	self should: [manager add: material.] raise: Exception