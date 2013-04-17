#!/bin/bash
#
# checks for build success/failure and dumps appropriate file to stdou
#
#      -verbose flag causes unconditional transcript display
#
# Copyright (c) 2012 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#
if ( test -e TravisCISuccess.txt); then 
  echo "SUCCESS: $(basename $0)"
  cat TravisCISuccess.txt # dump first in case travis truncates log
  if [ "$1" = "-verbose" ] ; then
    $BUILDER_CI_HOME/dumpTranscript.sh
    cat TravisCISuccess.txt # dump last in case travis doesn't truncate log
  fi
  exit 0
fi
if ( test -e TravisCIFailure.txt ); then 
  echo "FAILURE: $(basename $0)"
  cat TravisCIFailure.txt # dump first in case travis truncates log
  $BUILDER_CI_HOME/dumpTranscript.sh
  cat TravisCIFailure.txt # dump last in case travis doesn't truncate log
  exit 1
fi
echo "neither SUCCESS nor FAILURE: $(basename $0)"
if [ "$1" = "-verbose" ] ; then
  $BUILDER_CI_HOME/dumpTranscript.sh
fi
