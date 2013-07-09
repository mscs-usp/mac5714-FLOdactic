as yet unclassified
createEditComponent: anObject
	| component |
	component := FLOEditSubjectComponent new: parent.
	anObject ifNotNil: [
		component edit: anObject ].
	^ component
	