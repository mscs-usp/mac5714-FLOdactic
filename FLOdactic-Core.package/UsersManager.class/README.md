UsersManager class

Responsability: Manage all the users on the system.

Restrictions:
	- Username cannot be empty (verified with testEmptyUsername)
	- Password cannot be empty (verified with testEmptyPassword)
	- Email cannot be empty (verified with testEmptyEmail)
	- Role cannot be empty (verified with testEmptyRole)
	- Status cannot be empty (verified with testEmptyStatus)
	- Usernames must be unique (verified via items dictionary [test: testDuplicatedUsername])
	- Emails must be unique (verified via emailsSet [test: testDuplicatedEmails])
	* Test class: UserTests