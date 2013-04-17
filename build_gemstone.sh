#!/bin/bash
#
# build_gemstone.sh -- Run Gemstone instance
#
# Copyright (c) 2013 VMware, Inc. All Rights Reserved <dhenrich@vmware.com>.
#

# help function
function display_help() {
	echo "$(basename $0) -i input -o output {-m} {-s script} {-f full-path-to-script} {-G} {-X}"
	echo " -f one or more scripts (full path) to build the image, can be intermixed with -m and -s options"
	echo " -i input product name, image from images-directory, or successful jenkins build"
	echo " -m use Metacello test harness: FileTree, Metacello, travisCIHarness.st, can be intermixed with -f and -s options"
	echo " -o output product name"
	echo " -s one or more scripts from the scripts-directory to build the image, can be intermixed with -m and -f options"
	echo " -G do not bootstrap GemStone to a known version of GLASS (currently GLASS 1.0-beta.8.7.4). Implies -X"
	echo " -X do not bootstrap metacello into the image"
}

echo "PROCESSING OPTIONS"

# parse options
BOOTSTRAP_METACELLO="include"
BOOTSTRAP_GLASS="include"
while getopts ":i:mGXo:f:s:?" OPT ; do
	case "$OPT" in

		# full path to script
	  	f)	if [ -f "$OPTARG" ] ; then
                	SCRIPTS=("${SCRIPTS[@]}" "$OPTARG")
			else
				echo "$(basename $0): invalid script ($OPTARG)"
				exit 1
			fi
			;;

		# input
		i)
			GEMSTONE_VERSION="$OPTARG"
			;;

    		# include standard Metacello test harness
    		m) SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/travisCIHarness.st" )
    			;; 

		# output
		o)	OUTPUT_NAME="$OPTARG"
			OUTPUT_PATH="$BUILD_PATH/$OUTPUT_NAME"
			OUTPUT_ZIP="$BUILD_PATH/$OUTPUT_NAME.zip"
			OUTPUT_SCRIPT="$OUTPUT_PATH/$OUTPUT_NAME.st"
			OUTPUT_IMAGE="$OUTPUT_PATH/$OUTPUT_NAME.image"
			OUTPUT_CHANGES="$OUTPUT_PATH/$OUTPUT_NAME.changes"
			OUTPUT_CACHE="$OUTPUT_PATH/package-cache"
      			case "$ST" in
        			Squeak*) 
          				OUTPUT_DEBUG="$OUTPUT_PATH/SqueakDebug.log"
          			;; 
        			Pharo*) 
          				OUTPUT_DEBUG="$OUTPUT_PATH/PharoDebug.log" 
          			;;
      			esac
			OUTPUT_DUMP="$OUTPUT_PATH/crash.dmp"
			;;

		# script
		s)	
			if [ -f "$SCRIPTS_PATH/$OPTARG" ] ; then
                		SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/$OPTARG")
			else
				echo "$(basename $0): invalid script ($OPTARG)"
				exit 1
			fi
			;;

		# exlude GLASS bootstrap
		G) 
			BOOTSTRAP_METACELLO="exclude"
			BOOTSTRAP_GLASS="exclude"
			;;

		# exclude Metacello bootstrap
    		X) BOOTSTRAP_METACELLO="exclude"
    			;;

		# show help
		\?)	display_help
			exit 1
		;;

	esac
done

echo "preparing script files"

# prepare output path
if [ -d "$OUTPUT_PATH" ] ; then
	rm -rf "$OUTPUT_PATH"
fi
mkdir -p "$OUTPUT_PATH"

# hook up the git_cache, Metacello bootstrap and mcz repo

ln -sf "$GIT_PATH" "$OUTPUT_PATH/"
ln -sf "$BUILDER_CI_HOME/mcz" "$OUTPUT_PATH/"
ln -sf "$BUILDER_CI_HOME/scripts/Metacello-Base.st" "$OUTPUT_PATH/"
ln -sf "$BUILDER_CI_HOME/scripts/FileStream-show.st" "$OUTPUT_PATH/"
ln -sf "$BUILDER_CI_HOME/scripts/MetacelloBuilderTravisCI.st" "$OUTPUT_PATH/"

if [ "$BOOTSTRAP_GLASS" == "include" ] ; then
	BEFORE_SCRIPTS=("$SCRIPTS_PATH/before_gemstone.st" "$SCRIPTS_PATH/before.st")
else
        BEFORE_SCRIPTS=("$SCRIPTS_PATH/patch_gemstone.st" "$SCRIPTS_PATH/before.st")
fi


# special doit needed for 2.4.4.x
case "$ST" in
        GemStone-2.4.4.1|GemStone-2.4.4.7)
	BEFORE_SCRIPTS=("${BEFORE_SCRIPTS[@]}" "$SCRIPTS_PATH/gemstone244x.st")
        ;;
        *) #do nothing by default
        ;;
esac

# prepare script file
if [ "$BOOTSTRAP_METACELLO" == "include" ] ; then
  BEFORE_SCRIPTS=("${BEFORE_SCRIPTS[@]}" "$SCRIPTS_PATH/bootstrapMetacello.st")
else
  BEFORE_SCRIPTS=("${BEFORE_SCRIPTS[@]}" "$SCRIPTS_PATH/bootstrapGofer.st")
fi
SCRIPTS=("${BEFORE_SCRIPTS[@]}" "${SCRIPTS[@]}" "$SCRIPTS_PATH/after.st")

for FILE in "${SCRIPTS[@]}" ; do
	echo "run" >> "$OUTPUT_SCRIPT"
	echo "\"builderCI file: $FILE\"" >> "$OUTPUT_SCRIPT"
	cat "$FILE" >> "$OUTPUT_SCRIPT"
	echo "%" >> "$OUTPUT_SCRIPT"
	echo "commit" >> "$OUTPUT_SCRIPT"
done

cd ${BUILD_PATH}/travisCI
source /opt/gemstone/product/seaside/defSeaside #set GemStone environment variables
# gslist -lc

echo "synchronize timezones"

topaz -l -q <<EOF
set gemstone seaside
set user SystemUser pass swordfish
iferr 1 stk
iferr 2 stack
iferr 3 exit 1
status
login

run
TimeZone default: TimeZone fromLinux
%

commit
exit 0
EOF

if [[ $? != 0 ]] ; then
  exit 1;
fi

echo "RUNNING TESTS..."

while true; do sleep 60; echo "travis ... be patient PLEASE: https://github.com/dalehenrich/builderCI/issues/38"; done &

topaz -l -q -T100000 <<EOF
output push travis_gem.log only
set gemstone seaside
set user DataCurator pass swordfish
iferr 1 stk
iferr 2 stack
iferr 3 exit 1
status
login
run
Transcript cr; show: 'GLASS version: ', ConfigurationOfGLASS project currentVersion versionString.
%
input $OUTPUT_SCRIPT
exit 0
EOF

if [[ $? != 0 ]] ; then
  mv travis_gem.log TravisTranscript.txt
  exit 1; 
fi

mv travis_gem.log TravisTranscript.txt

kill %1 #kill Issue #38 travis loop

# remove cache link
rm -rf "$OUTPUT_CACHE" "$OUTPUT_ZIP"
(
	cd "$OUTPUT_PATH"
)

# success
exit 0
