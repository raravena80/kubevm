#!/usr/bin/env bats

teardown() {
  kubevm delete example2
}

@test "should copy the example config to example2" {
  run kubevm copy example example2

  [ "$status" -eq 0 ]
  [ "$output" = "Copying: example to example2" ]
}
