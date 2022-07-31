#!/bin/bash
set -e
export THIS_DIR=$(dirname $(readlink -f $0))
DEST_DIR="$1"
[ "$DEST_DIR" == "" ] && echo "No directory specified, assuming ~/bin" && DEST_DIR=~/bin
[ ! -d $DEST_DIR ] && echo "Directory $DEST_DIR DOES NOT exist. Aborting." && exit 1

#TODO: Add a check and warning about not installing to a location in the PATH, but proceed anyways.

cp -TRv "$THIS_DIR/.jcd-new/" "$DEST_DIR/.jcd-new/"
cp "$THIS_DIR/jcd-new" "$DEST_DIR"
chmod u+x "$DEST_DIR/jcd-new"
