hashing and verification
hashString: str
    ^ ((Hasher hashMessage: str) printStringBase: 16) forceTo: 40 paddingStartWith: $0 