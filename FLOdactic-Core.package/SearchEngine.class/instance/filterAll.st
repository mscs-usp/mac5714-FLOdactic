filtering
filterAll
	"This filter expression doesn't filter anything, it's used to return the results unmodified on the admin / moderators searches"
	| test |

	test := self checkNullResults.
	test ifFalse: [
		^ [ :didacticMaterial | true].
	].