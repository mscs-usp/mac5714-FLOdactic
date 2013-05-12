initialize-release
remove: aDidacticMaterial
	"Removes from the structure anUriString. Raises errors on:
	- Non existing anUriString (verified with...)"
	
	| item test msg anUriString |
	anUriString := aDidacticMaterial uri.
	test := items includesKey: anUriString.
	(test) ifTrue: [
		msg := 'The didactic material exists on the system, removing it...'.
		Transcript show: msg; crlf.
		item := items at: anUriString.
		items removeKey: anUriString.
	].
	(test) ifFalse: [
		msg := 'The didactic material doesnt exists on the system, cannot remove it...'.
		Transcript show: msg; crlf.
		"self error: msg"

	].