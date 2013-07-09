time
addTag: aTagString
	"Adds aTagString to the tags"

	| tag testIncludedTag tagsManager |
	
	tagsManager := TagsManager singleton.
	
	testIncludedTag := tagsManager includesKey: aTagString.
	"If it exists on the manager, get it"
	testIncludedTag ifTrue: [
		tag := tagsManager at: aTagString.
	]
	"else, add it to the manager"
	ifFalse: [
		tag := TagObject new.
		tag name: aTagString.
		tagsManager add: aTagString -> tag.
	].
	"finally add it to the tags object Dictionary itself"
	tags add: aTagString -> tag.