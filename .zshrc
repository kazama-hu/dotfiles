export TERM="xterm-256color"
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Automatic launch tmux
if [ -z "$TMUX" -a -z "$STY" ]; then
   if type tmuxx > /dev/null 2>&1; then
      tmuxx
   elif type tmux > /dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
          tmux attach && echo "tmux attached session "
        else
          tmux new-session && echo "tmux created new session"
        fi
   elif type screen > /dev/null 2>&1; then
        screen -rx || screen -D -RR
   fi
fi

# Anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
