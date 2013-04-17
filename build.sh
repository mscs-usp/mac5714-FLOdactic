#!/bin/bash
#
# build.sh -- Builds GemStone repository and Pharo/Squeak images
#   scripts. Best to be used together with Jenkins.
#
# Copyright (c) 2012,2013 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#

case "$ST" in

  PharoCore-1.0|PharoCore-1.1|PharoCore-1.2|PharoCore-1.3|Pharo-1.4|Pharo-2.0|Squeak-4.3|Squeak4.3|Squeak-4.4|Squeak-4.5)
        ./build_client.sh "$@"
        if [[ $? != 0 ]] ; then exit 1; fi
	exit 0
  ;;
  GemStone-2.4.4.1|GemStone-2.4.4.7|GemStone-2.4.5|GemStone-2.4.5.1|GemStone-2.4.5.2|GemStone-3.0.1|GemStone-3.1.0.2)
      	./build_gemstone.sh "$@"
      	if [[ $? != 0 ]] ; then exit 1; fi
	exit 0
  ;;

  # unknown
  *) echo "Unknown Smalltalk version ${ST}"
    exit 1
  ;;
esac

echo "shouldn't get here ..."
exit 1
