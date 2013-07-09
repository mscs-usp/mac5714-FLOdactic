as yet unclassified
createEditComponent: anObject
	| component |
	component := FLOEditClassComponent new: parent.
	anObject ifNotNil: [
		component edit: anObject ].
	^ component
	