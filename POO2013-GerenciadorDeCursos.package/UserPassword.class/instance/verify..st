hashing and verification
verify: password
    ^ hash isNil ifTrue: [ false ] ifFalse:  [ hash = (self hash: password) ]