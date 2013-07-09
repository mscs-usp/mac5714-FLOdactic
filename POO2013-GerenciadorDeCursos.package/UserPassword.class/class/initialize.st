initialization
initialize
    Hasher isNil ifTrue: [ Hasher := SecureHashAlgorithm new. ].
    Rng isNil ifTrue: [ Rng := Random new. ] 