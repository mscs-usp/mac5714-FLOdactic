creation
createSubjectWithName: aName creator: aCreator
	|newSubject|
	newSubject := CourseSubject withName: aName creator: aCreator.
	newSubject parent: self.
	^newSubject