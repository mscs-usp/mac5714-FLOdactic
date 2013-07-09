initialize-release
removeCourse: aCourse
	(self canRemove: aCourse) ifTrue: [
		courses remove: aCourse.
	].