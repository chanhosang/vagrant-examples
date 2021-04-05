#!/bin/bash

INSTALLFILE=/usr/local/bin/docker-compose
VERSION=$1
COMPOSE_VERSION=$($INSTALLFILE --version)
INSTALLED=$?
echo "$COMPOSE_VERSION" | grep "version $VERSION, build"
DIFFERENT=$?

if [ $INSTALLED == 127 ] || [ $DIFFERENT == 1 ]; then

  echo 'Not Installed or Different Version'

  echo "===> Installing docker-compose"
  #curl -L "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o $INSTALLFILE
  #chmod +x /usr/local/bin/docker-compose

  URL=https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m`

  OUT="$(mktemp)"

  # Handle interruption
  trap ctrl_c INT
  function ctrl_c() {
    echo "\nDownload interrupted"
    if [ -f "$OUT" ]; then
      rm $OUT
      echo "Removed temporary file '$OUT'"
    fi
    exit -1
  }

  # Download to temporary location
  echo "Download from '$URL' to temporary file '$OUT'"
  curl -L $URL > $OUT
  if [ $? != 0 ]; then
    rm $OUT
    echo "Download failed from '$URL'. Removed temorary file '$OUT'"
    exit -1
  fi

  # Move downloaded file to binary folder
  rm -f $INSTALLFILE
  mv $OUT $INSTALLFILE
  chmod ugo+rx $INSTALLFILE
  echo "Installed '$1' from '$2'"

  exit 1
else
  exit 0
fi
