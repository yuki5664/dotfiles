util::info 'install anyenv...'

if [[ ! -e ${HOME}/.anyenv ]]; then
  brew install anyenv
  # source ${HOME}/.zshenv

  # install anyenv plugins
  anyenv install --init
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

  # install *env
  anyenv install rbenv
  anyenv install nodenv
fi
anyenv update
anyenv git pull
# source ${HOME}/.zshenv
