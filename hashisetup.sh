#!/bin/bash

TOOL=${1}
VERSION=${2}

echo Installing ${TOOL} version ${VERSION}

DOWNLOAD_URL=https://releases.hashicorp.com/${TOOL}/${VERSION}/${TOOL}_${VERSION}_linux_amd64.zip

echo Fetching ${TOOL}...
curl -L $DOWNLOAD_URL > ${TOOL}.zip
echo Installing ${TOOL}...
unzip ${TOOL}.zip -d /usr/local/bin
chmod 0755 /usr/local/bin/${TOOL}
chown root:root /usr/local/bin/${TOOL}
rm ${TOOL}.zip
