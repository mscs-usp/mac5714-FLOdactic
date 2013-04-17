#!/bin/bash -x
#
# build_clone.sh -- Clone the git repositories
#
# Copyright (c) 2012 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#

# Environment variables defined in .travis.yml

# help function
function display_help() {
	echo "$(basename $0) -g clone_args"
	echo " -g one or more command lines `git clone` command"
}

# parse options
while getopts ":g:?" OPT ; do
	case "$OPT" in

		g) 
      cd $GIT_PATH
      git clone $OPTARG	
      if [ $? -ne 0 ]; then
       echo "invalid `git clone` arguments : ${OPTARG}" 
       exit 1; 
      fi
    ;;
		# show help
		\?)	display_help
			exit 1
		;;

	esac
done

# success
exit 0
