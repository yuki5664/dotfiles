#!/bin/zsh

#######################################
# General Settings                    #
#######################################
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export TZ=Asia/Tokyo

#######################################
# anyenv Settings                     #
#######################################
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#######################################
# Golang Settings                     #
#######################################
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

#######################################
# Fzf Settings                        #
#######################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

#######################################
# Terraform Settings                  #
#######################################
export PATH=$PATH:~/.bin
export PATH="$PATH:~/.tf"
