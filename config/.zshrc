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
autoload -Uz _zplugin
#plugin add
# Two regular plugins loaded without tracking.
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with tracking.
zplugin load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
#zplugin ice pick"async.zsh" src"pure.zsh"
#zplugin light sindresorhus/pure

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zplugin will
# grep operating system name and architecture automatically when there's no `bpick'.
zplugin ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zplugin load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zplugin
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: http://zdharma.org/zplugin/wiki/Compiling-programs
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zplugin light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras

zplugin snippet 'OMZ::lib/completion.zsh'
zplugin snippet 'OMZ::lib/compfix.zsh'
#github
zplugin snippet 'OMZ::plugins/github/github.plugin.zsh'
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'
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
