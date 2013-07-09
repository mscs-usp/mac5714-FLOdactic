as yet unclassified
edit: aMaterial
	material := aMaterial.
	selectedTags := (aMaterial tags values collect: [ :tag | tag name ]) asSet.
	selectedAuthors := (aMaterial authors values collect: [ :author | author name ]) asSet.
	selectedUsers := (aMaterial contributors values collect: [ :user | user username ]) asSet.
	isEditing := true