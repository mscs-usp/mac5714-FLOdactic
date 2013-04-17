initialization
initializeWithUri: aUriString owner: aUser
	"Initializes this material with the given URI and Owner."
	uri := aUriString.
	owner := aUser.
	created := Date today.
	modified := created.
	title := DefaultMaterialTitle.
	type := DefaultMaterialType.
	license := DefaultMaterialLicense.
	authors := OrderedCollection new.
	tags := OrderedCollection new.
	self initialize.
	