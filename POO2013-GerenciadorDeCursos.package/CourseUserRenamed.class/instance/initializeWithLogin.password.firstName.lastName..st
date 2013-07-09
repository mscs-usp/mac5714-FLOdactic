initialization
initializeWithLogin: aLogin password: aPassword firstName: aFirstName lastName: aLastName
    self initialize.

    self login: aLogin;
         password: aPassword;
         firstName: aFirstName;
         lastName: aLastName.

    createdUnits := Set new.
    moderatedTopics := Set new.
    participatingClasses := Set new 