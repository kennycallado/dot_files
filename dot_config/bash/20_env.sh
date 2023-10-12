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

# Set the default browser
if [ "luakit --version" ]; then
  export BROWSER="luakit"
elif [ "firefox --version" ]; then
  export BROWSER="firefox"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
