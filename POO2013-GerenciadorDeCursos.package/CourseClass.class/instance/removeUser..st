membership
removeUser: user
    user = nil ifTrue: [
        self error: 'user cannot be nil'.
    ].

    users remove: user ifAbsent: [].
    ^ self 