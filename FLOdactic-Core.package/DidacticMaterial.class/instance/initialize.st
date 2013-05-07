accessing
initialize
	super initialize.
	
	"No attribute is mandatory at this point, everything will be checked when it will be added"
	uri := nil.
	title := nil.
	description := nil.
	type := nil.
	license := nil.
	status := nil.
	
	"Agregations"
	author := nil.
	owners := Dictionary new.
	
	
