#powerline-go
function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -condensed -cwd-max-depth 3 -error $? -shell zsh)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

#--------
#enable color
autoload -Uz colors
colors
#bind
bindkey -v
#completions
autoload -Uz compinit
#history
HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_expand
#command correction
setopt correct

#--------
#zplugin
source ~/.zplugin/bin/zplugin.zsh
#plugin add
#zsh-autosuggestions
zplugin light zsh-users/zsh-autosuggestions
#completions
zplugin light zsh-users/zsh-completions
zplugin light chrissicool/zsh-256color
zplugin light zsh-users/zsh-completions
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zplugin snippet OMZ::plugins/minikube/minikube.plugin.zsh
zplugin snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
#history
zplugin light zsh-users/zsh-history-substring-search
#fast-syntax-highlighting
zplugin light zdharma/fast-syntax-highlighting
#zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#zsh-completions
#fpat=(~/.zsh/zsh-completions/src $fpath)

#neovim
alias vi='nvim'

#Browser
export BROWSER="/usr/bin/google-chrome-stable"

#ls 
alias ll='ls -la'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
