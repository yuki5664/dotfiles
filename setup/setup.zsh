#!/bin/bash -e

cd $HOME/dotfiles

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
     for dotfile in *; do
	  if [[ ${dotfile} != 'setup' ]] && [[ ${dotfile} != 'config' ]] && [[ ${dotfile} != 'vscode' ]] && [[ ${dotfile} != 'README.md' ]]; then
        	[[ $dotfile =~ $IGNORE_PATTERN ]] && continue
        	ln -snfv "$(pwd)/$dotfile" "$HOME/.$dotfile"
          fi
     done
echo "Success"
