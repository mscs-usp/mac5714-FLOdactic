creation
createTopicWithName: aName creator: aCreator
	|newTopic|
	newTopic := CourseTopic withName: aName creator: aCreator.
	newTopic parent: self.
	^ newTopic