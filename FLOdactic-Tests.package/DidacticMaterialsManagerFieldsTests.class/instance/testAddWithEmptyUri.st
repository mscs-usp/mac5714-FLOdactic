as yet unclassified
testAddWithEmptyUri
	"comment stating purpose of message"

	material title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	
	self should: [manager owner: user add: material] raise: ValidationError.