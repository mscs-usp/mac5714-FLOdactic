as yet unclassified
createEditComponent: anObject
	| component |
	component := FLOEditCourseComponent new.
	anObject ifNotNil: [
		component edit: anObject ].
	^ component
	