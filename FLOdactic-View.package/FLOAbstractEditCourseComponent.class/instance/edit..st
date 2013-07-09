as yet unclassified
edit: anItem
	item := anItem.
	selectedTags := (item tags values collect: [ :tag | tag name ]) asSet.
	selectedColaborators := (item colaborators values collect: [ :user | user username ]) asSet.
	isEditing := true