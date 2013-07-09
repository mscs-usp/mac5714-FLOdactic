as yet unclassified
pathFor: aString
	^ (aString select: [ :each | each isAlphaNumeric ]) asLowercase