#!/bin/bash
#

# Integrations
# ===========

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Kitty
# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Chezmoi
if [ -z "chezmoi --version > /dev/null 2>&1" ]; then
  source <(chezmoi completion bash)
fi

# Ng
# check if the ng command exists
if [ -z "ng version > /dev/null 2>&1" ]; then
  # Load Angular CLI autocompletion.
  source <(ng completion script)
fi


