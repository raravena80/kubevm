#!/usr/bin/env bats

@test "should show the current version of kubevm" {
  run kubevm version

  [ "$status" -eq 0 ]
  [[ "$output" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}
