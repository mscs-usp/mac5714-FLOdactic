identification
firstName: aFirstName   
    aFirstName isEmptyOrNil ifTrue: [
        self error: 'invalid firstName'.
    ].
    
    firstName := aFirstName.
    ^ self 