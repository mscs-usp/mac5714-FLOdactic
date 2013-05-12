accessing
add: aTag
	
	self validate: aTag.

	items add: aTag name -> aTag.
	Transcript show: 'Tag doesnt exists on the system, adding it...'.
