accessing
items
	"Returns a Dictionary with the items within the structure.
	This returns a very deep copy of the actual items so modifications doesn't compromise the actual data, nor creates unwanted side effects."

	^ items veryDeepCopy.