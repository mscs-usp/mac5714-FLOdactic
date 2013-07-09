searching
searchCourses: aStringExpression in: aCourseUnit
	| collection searchExpression |
	aCourseUnit
		ifNil: [ collection := coursesManager items ]
		ifNotNil: [ collection := aCourseUnit children ].
	
	(aStringExpression isEmptyOrNil)
		ifFalse: [
			searchExpression := self wildCardExpression: aStringExpression.
			Transcript show: searchExpression; cr.
			searchResults := collection select: [ :item |
				Transcript show: item title; cr.
				Transcript show: item description; cr.

				(searchExpression match: item code) or:
				(searchExpression match: item title) or:
				(searchExpression match: item description) ] ]
		ifTrue: [
			searchResults := collection ].
	^ searchResults