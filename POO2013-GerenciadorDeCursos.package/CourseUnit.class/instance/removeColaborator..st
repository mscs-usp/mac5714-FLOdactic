ownership and permissions
removeColaborator: colaborator
    colaborator = nil ifTrue: [
        self error: 'Colaborator cannot be nil'.
    ].

    colaborators remove: colaborator ifAbsent: [].
    ^ self 