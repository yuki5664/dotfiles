export CLICOLOR=1

echo hello yuki!

# .zshenv
source $HOME/.zshenv

# Load aliases
source $HOME/.aliases.zsh

# Load zplug
source $HOME/.zplug.zsh

autoload -Uz compinit && compinit  # Gitの補完を有効化

# setting default PATH
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

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
