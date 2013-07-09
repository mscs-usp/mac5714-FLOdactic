identification
lastName: aLastName
    aLastName isEmptyOrNil ifTrue: [
        self error: 'invalid lastName'.
    ].
    
    lastName := aLastName.
    ^ self 