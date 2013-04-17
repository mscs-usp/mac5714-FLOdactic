as yet unclassified
initialize
	"FLOdactic constants initializer"
	MaterialStatuses := #(Available Blocked).
	MaterialTypes := #(Book Article Video Audio Slides Exercises Unspecified).
	DefaultMaterialType := #Unspecified.
	DefaultMaterialTitle := 'Untitled'.
	MaterialLicenses := #(CreativeCommons Proprietary).
	DefaultMaterialLicense := #CreativeCommons.
	
	DefaultAuthorName := 'Unknown'.
