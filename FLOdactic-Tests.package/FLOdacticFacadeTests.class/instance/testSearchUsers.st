as yet unclassified
testSearchUsers
	"comment stating purpose of message"

	| results |
	results := testui searchUsers: '*Smith*'.
	self assert: [results size = 2].
	self assert: [results includesKey: 'john'].
	self assert: [results includesKey: 'joane'].

	results := testui searchUsers: 'bob@flodactic.org'.
	self assert: [results size = 1].
	self assert: [results includesKey: 'bob'].
