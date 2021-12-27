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
)

brew upgrate

for formula in ${formulas[@]}; do
  brew install ${formula}
done

for cask_formula in ${cask_formulas[@]}; do
  brew install --cask ${formula}
done

brew cleanup
