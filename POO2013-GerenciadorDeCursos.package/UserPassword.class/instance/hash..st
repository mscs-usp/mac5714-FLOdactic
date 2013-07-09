hashing and verification
hash: password
    | str |
    password = nil ifTrue: [
        self error: 'password cannot be nil'.
    ]. 

    str := password.
    iterations timesRepeat: [
        str := str, salt.
        str := self hashString: str.
    ].

    ^ str 