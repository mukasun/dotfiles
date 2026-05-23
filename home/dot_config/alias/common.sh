#!/usr/bin/env bash

# Shared shell aliases used across machines.
# These aliases wrap common repository and local workflow commands.

# Use eza for ls command
alias ls="eza --long --group --header --binary --time-style=long-iso --icons"

# Alias to checkout the default branch in git
alias gm='git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
