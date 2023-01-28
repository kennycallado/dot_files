#!/bin/bash
#

# Env
# ===

# Set the default editor
if [ "lvim --version" ]; then
  EDITOR="lvim"
elif [ "nvim --version" ]; then
  EDITOR="nvim"
fi
