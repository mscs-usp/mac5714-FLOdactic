initialize-release
remove: aNameString
	items removeKey: aNameString ifAbsent: [
		self error: 'The author does not exists on the system, cannot remove it' ]