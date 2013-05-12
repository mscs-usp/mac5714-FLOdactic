as yet unclassified
removeAll
	"Internal method only. Not intended to be used as part of the main API"

	items keysDo: [:key | 
		Transcript show: 'Removing...', key printString; cr.
		items removeKey: key.
	].
