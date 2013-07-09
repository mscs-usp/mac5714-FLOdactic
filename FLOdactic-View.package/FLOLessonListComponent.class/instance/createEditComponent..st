as yet unclassified
createEditComponent: anObject
	| component |
	component := FLOEditLessonComponent new: parent.
	anObject ifNotNil: [
		component edit: anObject ].
	^ component
	