as yet unclassified
defaultFilterPolicy: anExpressionString
	"This is the default policy for searching message
	We decided to wrap the expression with wildcards as default, this can be easily changed here"

	^ self wildCardExpression: anExpressionString.