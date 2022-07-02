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

# ------------------------------
# kubectl
# ------------------------------
alias -g KP='$(kubectl get pods | fzf | awk "{print \$1}")'
alias -g KD='$(kubectl get deploy | fzf | awk "{print \$1}")'
alias -g KS='$(kubectl get svc | fzf | awk "{print \$1}")'
alias -g KI='$(kubectl get ing | fzf | awk "{print \$1}")'
alias -g KJ='$(kubectl get job | fzf | awk "{print \$1}")'
alias -g KA='$(kubectl get all | awk "! /NAME/" | fzf | awk "{print \$1}")'
alias kubectle='kubectl exec -it KP'
alias kubectll='kubectl stern $(kubectl get deploy | fzf | awk "{print \$1}")'
alias kubectlo='kubectl get KA -o yaml'
