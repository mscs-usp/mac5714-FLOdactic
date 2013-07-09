time
creationDate: date
    date = nil ifTrue: [
        self error: 'creationDate cannot be nil'.
    ].

    creationDate := date.
    ^ self 