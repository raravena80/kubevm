#!/usr/bin/env bash

__kubevm_config()
{
  configurations="configurations"
  current_path="$_KUBEVM_ROOT/current"

  config=$1
  if [[ -z "$config" ]]; then
    config=$(readlink $current_path | sed "s/$configurations\///")
  fi

  default_path="$_KUBEVM_ROOT/$configurations/default"
  config_path="$configurations/$config"

  if [[ "$config" == "default" ]]; then
    config=$(readlink $default_path) || true
  fi

  return 0
}
export -f __kubevm_config
