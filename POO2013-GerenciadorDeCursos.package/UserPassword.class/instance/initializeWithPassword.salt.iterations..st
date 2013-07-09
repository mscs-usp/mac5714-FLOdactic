initialization
initializeWithPassword: password salt: aSalt iterations: numIterations
    self initialize.

    iterations := numIterations.
    salt := self hashString: (aSalt asString).
    hash := (self hash: password) 