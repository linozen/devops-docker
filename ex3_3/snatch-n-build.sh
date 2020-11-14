#!/bin/bash

if [ -z "$1" ] ; then
   echo "Usage: $0 username/repo"
   exit 1
fi

#  image name
NAME=$(echo "$1" | awk -F/ '{print $NF}' | awk -F. '{print $1}')
NAME="linozen/${NAME}"

#  show tagging action
echo "URL ${1} will be tagged as linozen/${name}"

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d -p "$DIR"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# clone
git clone "https://github.com/${1}.git" ${WORK_DIR}/git/

# change into the dir
cd ${WORK_DIR}/git

# build
docker build -t ${NAME} .

# push
docker push ${NAME}
