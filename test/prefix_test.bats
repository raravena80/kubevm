#!/usr/bin/env bats

@test "should print the kubevm root" {
  run kubevm prefix

  [ "$status" -eq 0 ]
  if [ ! -z $TRAVIS_BUILD_DIR ]; then
    [ "$output" = "$TRAVIS_BUILD_DIR" ]
  else
    [ "$output" = "/root/.kubevm" ]
  fi
}
