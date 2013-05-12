as yet unclassified
testAddWithSameUriSameObject
	"comment stating purpose of message"

	material uri: 'uri'; title: 'title'; description: 'description'; type: 'type'; license: 'license'.
	manager owner: user add: material.
	
	material description: 'changed description'.
	manager validate: material.
	
	self assert: [(manager items at: 'uri') description = 'changed description']