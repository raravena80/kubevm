#!/usr/bin/env bats

setup() {
  touch $(kubevm prefix)/configurations/example/knife.rb
  touch $(kubevm prefix)/configurations/example/myuser.pem
  touch $(kubevm prefix)/configurations/example/myvalidator.pem
}

@test "should have the exports directory" {
  kubevm_root=$(kubevm prefix)

  [ -d "$kubevm_root/exports" ]
}

@test "should create a tar file for the export" {
  kubevm_root=$(kubevm prefix)
  run kubevm export example

  [ "$status" -eq 0 ]
  [ "$output" = "Exporting: example" ]
  [ -f "$kubevm_root/exports/example.tar.gz" ]
}

@test "should ignore key files by default" {
  kubevm_root=$(kubevm prefix)
  run kubevm export example

  [ "$status" -eq 0 ]

  tempfile=$(mktemp -t kubevm-export-ignore-keys.XXXXXXXXXX)
  rm $tempfile
  mkdir -p $tempfile
  pushd $tempfile > /dev/null
  tar xzf $kubevm_root/exports/example.tar.gz

  [ -f "knife.rb" ]
  [ ! -f "myuser.pem" ]
  [ ! -f "myvalidator.pem" ]

  popd > /dev/null
  rm -rf $tempfile
}

@test "should be able to include key files" {
  kubevm_root=$(kubevm prefix)
  run kubevm export example --include-keys

  [ "$status" -eq 0 ]

  tempfile=$(mktemp -t kubevm-export-ignore-keys.XXXXXXXXXX)
  rm $tempfile
  mkdir -p $tempfile
  pushd $tempfile > /dev/null
  tar xzf $kubevm_root/exports/example.tar.gz

  [ -f "knife.rb" ]
  [ -f "myuser.pem" ]
  [ -f "myvalidator.pem" ]

  popd > /dev/null
  rm -rf $tempfile
}
