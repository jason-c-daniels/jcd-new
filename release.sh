#!/bin/bash
set -e
export THIS_DIR=$(dirname $(readlink -f "$0"))
DEST_DIR="$1"
[ "$DEST_DIR" == "" ] && echo "No destination directory specified, assuming current directory" && DEST_DIR="$THIS_DIR"
VERSION=$(<"$THIS_DIR/src/.jcd-new/VERSION")
ZIP_FILE_NAME="$DEST_DIR/jcd-new_v$VERSION.zip"
echo "creating zip file $ZIP_FILE_NAME"
pushd "$THIS_DIR/src"

zip -r "$ZIP_FILE_NAME" .

echo "Adding/resetting version tag v$VERSION"
git tag -f "v$VERSION"

echo "You will need to manually upload the release and push the version tag to GitHub."
popd
