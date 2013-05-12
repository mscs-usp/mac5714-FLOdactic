accessing
select: aFilterBlock
	"Performs a Collection select using the passed in argument. Returns the resulting collection."

	^ items select: aFilterBlock.
	