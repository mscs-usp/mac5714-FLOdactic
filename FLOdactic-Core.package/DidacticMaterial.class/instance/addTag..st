accessing
addTag: aTagString
	"Adds aTagString to the tags"

	| tag testIncludedTag manager |
	manager := TagsManager singleton.
	
	testIncludedTag := manager includesKey: aTagString.
	"If it exists on the manager, get it"
	testIncludedTag ifTrue: [
		tag := manager at: aTagString.
	]
	"else, add it to the manager"
	ifFalse: [
		tag := TagObject new.
		tag name: aTagString.
		manager add: aTagString -> tag.
	].
	"finally add it to the tags object Dictionary itself"
	tags add: aTagString -> tag.