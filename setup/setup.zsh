#!/bin/bash -e

cd ${HOME}/dotfiles

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
     for dotfile in *; do
	  if [[ ${dotfile} != 'setup' ]] && [[ ${dotfile} != 'config' ]] && [[ ${dotfile} != 'vscode' ]] && [[ ${dotfile} != 'README.md' ]]; then
        	[[ ${dotfile} =~ ${IGNORE_PATTERN} ]] && continue
        	ln -snfv "$(pwd)/$dotfile" "${HOME}/.${dotfile}"
          fi
     done
echo "Success"

echo "Create config links."
# deploy config
if [[ ! -d ${HOME}/.config ]]; then
  mkdir ${HOME}/.config
fi
cd config
for name in *; do
  if [[ -L ${CONFIG_HOME:-$HOME/.config}/$name ]]; then
    unlink ${CONFIG_HOME:-$HOME/.config}/$name
  fi
  ln -sfv ${PWD}/${name} ${CONFIG_HOME:-$HOME/.config}/${name}
done
echo "Success"
