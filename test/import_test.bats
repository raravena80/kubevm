#!/usr/bin/env bats

setup() {
  touch $(kubevm prefix)/configurations/example/knife.rb
  touch $(kubevm prefix)/configurations/example/myuser.pem
  kubevm export example > /dev/null
}

teardown() {
  kubevm delete new_example > /dev/null
}

@test "should be able to import a configuration" {
  run kubevm import $(kubevm prefix)/exports/example.tar.gz new_example

  [ "$status" -eq 0 ]
  [ "$output" = "Importing '$(kubevm prefix)/exports/example.tar.gz' as 'new_example'" ]

  run kubevm list
  [ "${lines[0]}" = "*= example" ]
  [ "${lines[1]}" = "   new_example" ]
}
