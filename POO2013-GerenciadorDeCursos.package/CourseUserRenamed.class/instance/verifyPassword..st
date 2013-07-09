identification
verifyPassword: aPassword
    ^ password isNil ifTrue: [ false ] ifFalse: [ password verify: aPassword ] 