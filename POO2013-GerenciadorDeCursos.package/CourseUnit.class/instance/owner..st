ownership and permissions
owner: anOwner
    anOwner = nil ifTrue: [
        owner := creator.
    ] ifFalse: [
        anOwner = owner ifFalse: [
            owner := anOwner.
        ].
    ].

    ^ self 