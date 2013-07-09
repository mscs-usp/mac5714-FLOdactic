instance creation
withName: aName creator: aCreator creationDate: date
    ^ self basicNew
           initializeWithName: aName creator: aCreator creationDate: date;
           yourself 