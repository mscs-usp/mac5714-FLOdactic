initialize-release
initialize
	"Class responsability: takes cares of a didactic material entity"
	super initialize.
	
	"No attribute is mandatory at this point, everything will be checked when it will be added"
	uri := nil.
	title := nil.
	description := nil.
	type := nil.
	license := nil.
	status := nil.
	
	"Agregations"
"	author := nil."
	contributors := Dictionary new.
	authors := Dictionary new.
	tags := Dictionary new.
	tagsManager := TagsManager singleton.
"	owners := nil."
	
	
