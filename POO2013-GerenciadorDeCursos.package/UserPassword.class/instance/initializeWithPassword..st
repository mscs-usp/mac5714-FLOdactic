initialization
initializeWithPassword: password
    self initializeWithPassword: password
         salt: (Hasher hashInteger: (Rng nextValue asInteger))
         iterations: 1000 