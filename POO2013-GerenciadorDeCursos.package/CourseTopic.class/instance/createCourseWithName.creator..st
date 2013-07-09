creation
createCourseWithName: aName creator: aCreator
	|newCourse|
	newCourse := CourseCourse withName: aName creator: aCreator.
	newCourse parent: self.
	^newCourse