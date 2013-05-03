as yet unclassified
testAddWithEmptyUri
	"comment stating purpose of message"

	material title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
	self should: [manager add: material.] raise: Exception