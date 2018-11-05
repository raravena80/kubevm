#!/usr/bin/env bats

setup() {
  kubevm create test
  kubevm use example
}

teardown() {
  kubevm delete test
  kubevm default example
}

@test "should list all the configurations" {
  run kubevm list

  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "   test" ]
  [ "${lines[0]}" = "*= example" ]
}

@test "should show the active and default configuration" {
  kubevm use test

  run kubevm list
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "=> test" ]
  [ "${lines[0]}" = "*  example" ]
}
