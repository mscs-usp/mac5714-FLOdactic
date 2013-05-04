accessing
select: aFilter
	"Returns a structure (Dictionary) of filtered items by aFilter criteria
	This should emulates something like 'list comprehensions' in python. Cool we manage to achieve this! =D
	"

	| result |
	result := DidacticMaterialsManager new.
	result addAll: (items select: aFilter).
	^ result.
	