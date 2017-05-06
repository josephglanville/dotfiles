#!/bin/bash

set -eo pipefail

DEST=$1
VERSION=1.010

FILENAME="SourceCodePro_FontsOnly-$VERSION.zip"
DIR="SourceCodePro_FontsOnly-$VERSION"

cleanup() {
  rm -f $FILENAME
  rm -rf $DIR
}

# Potentially clean up prior runs
cleanup

# Download, extract & set perms
curl -fLs https://github.com/downloads/adobe/source-code-pro/$FILENAME -o $FILENAME
unzip -u $FILENAME
chmod 644 $DIR/OTF/*.otf

# Install
mkdir -p $DEST
cp $DIR/OTF/*.otf $DEST

cleanup
