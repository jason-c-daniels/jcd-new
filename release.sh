#!/bin/bash
set -e
export THIS_DIR=$(dirname $(readlink -f "$0"))
DEST_DIR="$1"
[ "$DEST_DIR" == "" ] && echo "No destination directory specified, assuming current directory" && DEST_DIR="$THIS_DIR"
VERSION=$(<"$THIS_DIR/src/.jcd-new/VERSION")
ZIP_FILE_NAME="$DEST_DIR/jcd-new_v$VERSION.zip"

zip_ver=$(zip -v > /dev/null)
echo "zip detected."

git_ver=$(git --version)
echo "$git_ver detected."

pushd "$THIS_DIR/src"
echo "creating zip file $ZIP_FILE_NAME"
zip -r "$ZIP_FILE_NAME" .

echo "Adding/resetting version tag v$VERSION"
git tag -f "v$VERSION"

echo "You will need to manually upload the release and push the version tag to GitHub."
popd
