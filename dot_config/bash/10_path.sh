#!/bin/bash
#

# Path 
# ====

# Helpers functions
# =================
is_in_path() {
  # Check if a given path is in the PATH variable
    echo $PATH | grep -Eq "(^|:)$1(:|\$)"
}

# ====================================================================

# /sbin
is_in_path "/sbin" || export PATH="$PATH:/sbin"

# /usr/sbin
is_in_path "/usr/sbin" || export PATH="$PATH:/usr/sbin"

# .local/bin
is_in_path "$HOME/.local/bin" || export PATH="$PATH:$HOME/.local/bin"

# Npm
is_in_path "$HOME/.npm-global/bin" || export PATH="$PATH:$HOME/.npm-global/bin"

# Bun
is_in_path "$HOME/.bun/bin" || export PATH="$PATH:$HOME/.bun/bin"

# Cargo
. "$HOME/.cargo/env"
