accessing
addContributor: aContributor
	"Adds a contributor to the contributors, granting with editor permissions"

	contributors add: aContributor name -> aContributor.
	self touch.