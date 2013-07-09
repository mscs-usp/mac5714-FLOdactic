identification
login: aLogin
    (aLogin isEmptyOrNil or: [ aLogin size < 5 ]) ifTrue: [
        self error: 'invalid login'.
    ].

    login := aLogin.
    ^ self 