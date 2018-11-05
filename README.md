# KubeVM [![Build Status](https://travis-ci.org/raravena80/kubevm.svg?branch=master)](https://travis-ci.org/raravena80/kubevm) [![Apache Licensed](https://img.shields.io/badge/license-Apache2.0-blue.svg)](https://raw.githubusercontent.com/raravena80/kubevm/master/LICENSE)

Simple KUBE environment manager, usage inspired by wayneeseguin/rvm

Also modified from a fork of chefvm trobrock/chefvm

## Installation

    # KubeVM will create a symlink between (~/.kubevm -> ~/.kube ), make sure you have no ~/.kube directory before installing
    mv ~/.kube ~/.kube.bak
    git clone git://github.com/trobrock/kubevm.git ~/.kubevm
    ~/.kubevm/bin/kubevm init # Follow these instructions
    
After following these instructions reload your terminal, then

    kubevm create old_config
    mv ~/.kube.bak/* ~/.kubevm/configurations/old_config
    rm -rf ~/.kube.bak

## Usage

Put the files (config, etc) for `~/.kube` into a folder named whatever you want in the configurations folder, then you can use that name in place of `YOUR_KUBE_CONFIG` in the below commands

    # Use a specific config
    kubevm use {YOUR_KUBE_CONFIG|default}
    # or
    kubevm YOUR_KUBE_CONFIG

    # Set your default config
    kubevm default YOUR_KUBE_CONFIG

    # List your configurations, including current and default
    kubevm list

    # Create a new config
    kubevm create YOUR_KUBE_CONFIG

    # Delete a config
    kubevm delete YOUR_KUBE_CONFIG

    # Copy a config
    kubevm copy SRC_CONFIG DEST_CONFIG

    # Rename a config
    kubevm rename OLD_CONFIG NEW_CONFIG

    # Open a config directory in $EDITOR
    kubevm edit YOUR_KUBE_CONFIG

    # Update kubevm to the latest
    kubevm update


## Handy Prompt function
You can use `kubevm current` in PS1 in bash to see your current config in your prompt

    PS1="\$(kubevm current)" $

## Contributing

Fork and send a pull request.

# Running tests

The following will bring up an ubuntu based vm, install kubevm, and run the bats tests against it.

```shell
vagrant up
```

While the vm is up you can run the following to re-run tests without rebuilding the vm.

```shell
vagrant provision
```

When you are done.

```shell
vagrant down
```
