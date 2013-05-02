as yet unclassified
initialize
	"Initializes the object"

	"Mandatory user filled attributes"
	uri := nil.
	title := nil.
	description := nil.
	type := nil.
	license := nil.

	"Automatic attributes (defined by the manager)"
	created := DateAndTime now.
	modified := DateAndTime now.
	status := nil.
	
	"Agregations"
	owners := Dictionary new.
	authors := Dictionary new.
	tags := Dictionary new.