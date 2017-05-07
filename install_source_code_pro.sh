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
curl -fLso $FILENAME https://github.com/downloads/adobe/source-code-pro/$FILENAME
unzip -qqu $FILENAME
chmod 644 $DIR/OTF/*.otf

# Install
mkdir -p $DEST
cp $DIR/OTF/*.otf $DEST

cleanup
