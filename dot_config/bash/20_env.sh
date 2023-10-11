#!/bin/bash
#

# Env
# ===

# Set the default editor
if [ "lvim --version" ]; then
  export EDITOR="lvim"
elif [ "nvim --version" ]; then
  export EDITOR="nvim"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
