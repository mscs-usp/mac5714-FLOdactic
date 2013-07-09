accessing
add: anAuthor
	
	self validate: anAuthor.

	items add: anAuthor name -> anAuthor.
	Transcript show: 'Author doesnt exists on the system, adding it...'.
