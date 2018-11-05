#!/usr/bin/env bash

if [ $TRAVIS_BUILD_DIR ]; then
  CODE_PATH=$TRAVIS_BUILD_DIR
else
  CODE_PATH="$HOME/.kubevm"
fi

eval "$($CODE_PATH/bin/kubevm init -)"

bats $CODE_PATH/test
