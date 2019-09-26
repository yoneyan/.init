# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Theme
zplug "dracula/zsh", as:theme
# history
zplug "zsh-users/zsh-history-substring-search"
# type
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "chrissicool/zsh-256color"
# docker
zplug "docker/cli", use:"contrib/completion/zsh/_docker"
# git
zplug "plugins/git",   from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"
#pip
zplug "plugins/pip", from:oh-my-zsh


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

zstyle ':completion:*:default' menu select=2

#start tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
