#!/bin/bash
#

# Aliases
# =======

# Joshuto
alias lf=joshuto
# alias js=joshuto # I don't know if its a conflict with javascript in any way

# Kitty
alias kysd="nohup kitty --session session-dev > /dev/null 2>&1 & exit"
alias ktitle="kitty @ set-tab-title"
alias kssh="kitty +kitten ssh"
 
# Examples using docker
alias drhw="docker run --rm hello-world"
# alias phpServer="docker run --rm -p 80:80 -v ${PWD}/:/src -w /src php:latest php -S 0.0.0.0:80"
# alias composer="docker run --rm -it -v $(pwd):/app -w /app kennycallado/composer:2.2.4-php7.4 composer"

alias gtsh=go_to_sleep_hours
function go_to_sleep_hours() {
  echo "$1 * 60 * 60" | bc | xargs -I{} sudo rtcwake -u -s {} -m mem
}
