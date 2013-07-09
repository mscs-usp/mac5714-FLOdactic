identification
name: aName
    aName = nil ifTrue: [
        self error: 'Name cannot be nil'.
    ].
    name := aName.
    ^ self 