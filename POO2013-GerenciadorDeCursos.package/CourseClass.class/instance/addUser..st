membership
addUser: user
    user = nil ifTrue: [
        self error: 'user cannot be nil'.
    ].

    users add: user.
    ^ self 