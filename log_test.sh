#!/bin/bash

cd $TRAVIS_BUILD_DIR
if [ "$(cat log_error)" != "" ]
then
  echo "Unsuccessful tests:"
  cat log_error
  exit 1
fi
