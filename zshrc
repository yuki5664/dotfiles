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

# setting vscode terminal
bindkey -e

#######################################
# direnv Settings                     #
#######################################
eval "$(direnv hook zsh)"
export EDITOR='nvim'

#######################################
# anyenv Settings                     #
#######################################
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#######################################
# Golang Settings                     #
#######################################
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="/opt/homebrew/opt/go@1.20/bin:$PATH"

#######################################
# Fzf Settings                        #
#######################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

#######################################
# Terraform Settings                  #
#######################################
export PATH=$PATH:~/.bin
export PATH="$PATH:~/.tf"

source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

#######################################
# kubectl autocomplete Settings       #
#######################################
source <(kubectl completion zsh)

#######################################
# funcion to run npm using fzf        #
#######################################
function fzf_npm_scripts() {
  if [ ! -e package.json ]; then
    echo 'fzf_npm_scripts'
    echo 'There is no package.json'
    zle send-break
    return 1
  fi
  if ! type jq > /dev/null; then
    echo 'fzf_npm_scripts'
    echo 'jq command is required'
    zle send-break
    return 1
  fi

  local scripts=`jq -r '.scripts | to_entries | .[] | .key + " = " + .value' package.json 2>/dev/null || echo ''`
  if [[ -z $scripts ]]; then
    echo 'fzf_npm_scripts'
    echo 'There is no scripts in package.json'
    zle send-break
    return 1
  fi
  local selected=`echo $scripts | FZF_DEFAULT_OPTS='' fzf --height=50% --reverse --exit-0 | awk -F ' = ' '{ print $1}'`

  zle reset-prompt
  if [[ -z $selected ]]; then
    return 0
  fi
  BUFFER="npm run $selected"
  zle accept-line
}
zle -N fzf_npm_scripts
bindkey "^Xn" fzf_npm_scripts

#######################################
# Coogle Cloud CDK Setting            #
#######################################
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
