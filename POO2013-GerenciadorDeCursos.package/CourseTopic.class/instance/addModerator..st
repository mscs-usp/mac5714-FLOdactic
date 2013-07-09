ownership and permissions
addModerator: moderator
    moderator = nil ifTrue: [
        self error: 'moderator cannot be nil'.
    ].

    moderators add: moderator.
    ^ self 