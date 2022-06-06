# ==============================
# General
# ==============================
alias vim='nvim'
alias reload='source ~/.zshenv && source ~/.zshrc'

# ==============================
# list
# ==============================
alias ls="ls -FG"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

# ==============================
# doceker
# ==============================
alias lzd='lazydocker'
alias dc='docker compose'

# ==============================
# base64
# ==============================
alias encode='function __encode(){ echo -n "$1" | base64 }; __encode'
alias decode='function __decode(){ echo -n "$1" | base64 -d }; __decode'

# ==============================
# gcloud
# ==============================
alias gcpp='gcloud config set project $(gcloud projects list | fzf | awk "{print \$1}")'
