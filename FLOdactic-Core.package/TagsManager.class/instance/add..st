as yet unclassified
add: aTagString
	"Adds a tag to the internal structure.
	TODO: This doesnt makes much sense...
	I think it would be better to include this logic within the DidacticMaterialManager add message, so it will query if the Tag exist or not and do some stuff
	"

	| counter |
	(items includesKey: aTagString) ifTrue: [
		Transcript show: ' Tag already exists on the system, incrementing'.
		counter := items at: aTagString.
		items add: aTagString -> (counter + 1).
	].
	[(items at: aTagString)] ifError: [
		items add: aTagString -> 1.
		Transcript show: ' doesnt exists on the system, adding it...'.
	].