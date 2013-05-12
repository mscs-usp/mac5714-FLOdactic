as yet unclassified
remove: aTagNameString
	"Removes from the structure aTagNameString. Raises errors if:
	- Tag does not exist"
	
	items removeKey: aTagNameString ifAbsent: [
		self error: 'The tag does not exists on the system, cannot remove it...'.
	].
