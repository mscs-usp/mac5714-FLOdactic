ownership and permissions
removeModerator: moderator
    moderator = nil ifTrue: [
        self error: 'moderator cannot be nil'.
    ].

    moderators remove: moderator ifAbsent: [].
    ^ self 