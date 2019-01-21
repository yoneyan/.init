# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yonedayuto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)${reset_color} "
