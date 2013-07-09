instance creation
withName: aName creator: aCreator
    ^ self withName: aName creator: aCreator creationDate: (DateAndTime now)