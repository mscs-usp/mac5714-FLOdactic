| fileDirectoryClass fileInBlock resultFileBlock transcriptFileName transcriptStream platformIsGemStone |
"Initialize Image for batch testing with Metacello"
Smalltalk at: #Deprecation ifPresent: [:class | 
  (class respondsTo: #'raiseWarning:')
    ifTrue: [ class raiseWarning: false ]].
transcriptFileName := 'TravisTranscript.txt'.
(fileDirectoryClass := Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ 
    fileInBlock := [ :fileName | 
    (Smalltalk at: #'FileSystem') workingDirectory / fileName
      readStreamDo: [ :fileStream | fileStream fileIn ] ].
    resultFileBlock := [ :resultsFileName :streamBlock | 
    (Smalltalk at: #'FileSystem') workingDirectory / resultsFileName
      readStreamDo: streamBlock ].
    transcriptStream := ((Smalltalk at: #'FileSystem') workingDirectory
      / transcriptFileName) readStream ]
  ifNotNil: [ 
    fileInBlock := [ :fileName | 
    fileDirectoryClass default
      fileNamed: fileName
      do: [ :fileStream | fileStream fileIn ] ].
    resultFileBlock := [ :resultsFileName :streamBlock |
      fileDirectoryClass default forceNewFileNamed: resultsFileName do: streamBlock ].
    transcriptStream := fileDirectoryClass default
      newFileNamed: transcriptFileName ].
platformIsGemStone := false.
Smalltalk at: #MetacelloPlatform ifPresent: [:platformClass |
  platformIsGemStone := platformClass current defaultPlatformAttributes includes: #gemstone ].
platformIsGemStone
  ifFalse: [ fileInBlock value: 'FileStream-show.st' ].
fileInBlock value: 'MetacelloBuilderTravisCI.st'.
Smalltalk at: #'TravisResultFileBlock' put: resultFileBlock.
Smalltalk at: #'OLDTranscript' put: Transcript.
platformIsGemStone
  ifFalse: [ 
    "Transcript streams to stdout in GemStone by default"
    (Smalltalk globals associationAt: #'Transcript') value: transcriptStream.
    Transcript file lineEndConvention: #'lf' ].
Transcript
  cr;
  show: 'travis---->before.st'
