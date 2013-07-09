instance creation
withLogin: aLogin password: aPassword firstName: aFirstName lastName: aLastName
    ^ (self basicNew)
        initializeWithLogin: aLogin
        password: aPassword
        firstName: aFirstName
        lastName: aLastName;
        yourself 