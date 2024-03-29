#!/bin/zsh
source ${HOME}/dotfiles/setup/util.zsh

util::info 'install brew formulas...'

formulas=(
	anyenv
	cmake
	fzf
	git
	git-flow-avh
	gcc
	neovim
	openssl
	ripgrep
	sqlite
	tmux
	tree-sitter
	zsh-completions
	zsh-git-prompt
	kubectl
	kubectx
	lazydocker
	sops
	tree
	zplug
	httpie
	istioctl
	helm
	docker-machine-driver-vmware
	istioctl
)

cask_formulas=(
	google-chrome
	slack
	google-drive
	sourcetreee
	deepl
	visual-studio-code
	discord
	graphiql
	zoom
	docker
	iterm2
	notion
	kindle
	google-cloud-sdk
	dbeaver-community
	lens
)

brew upgrate

for formula in ${formulas[@]}; do
  brew install ${formula}
done

for cask_formula in ${cask_formulas[@]}; do
  brew install --cask ${formula}
done

brew cleanup
