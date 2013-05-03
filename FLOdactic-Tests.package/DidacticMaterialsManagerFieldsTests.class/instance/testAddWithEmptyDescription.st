as yet unclassified
testAddWithEmptyDescription
	"comment stating purpose of message"

	material uri: 'uri'; title: 'title'; type: 'type'; license: 'license'.
	
	self should: [manager add: material.] raise: Exception