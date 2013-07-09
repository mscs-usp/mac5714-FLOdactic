ownership and permissions
creator: aCreator
    aCreator = nil ifTrue: [
        self error: 'creator cannot be nil'.
    ].

    creator := aCreator.

    ^ self 