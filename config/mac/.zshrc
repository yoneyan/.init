#powerline-go
function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go -condensed -cwd-max-depth 3 -error $? -shell zsh)"
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


##
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -U promptinit; promptinit


#--------
#enable color
autoload -Uz colors
colors
#bind
bindkey -v
#completions
autoload -Uz compinit; compinit
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
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
#auto move directory
setopt auto_cd

#-------
#zplugin
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit

#plugin add
zplug momo-lab/zsh-abbrev-alias
# Two regular plugins loaded without tracking.
zplug light zsh-users/zsh-autosuggestions
zplug light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with tracking.
zplugin load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
#zplug ice pick"async.zsh" src"pure.zsh"
#zplug light sindresorhus/pure
zplug load "mafredri/zsh-async"

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zplug ice from"gh-r" as"program"
zplug load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zplugin will
# grep operating system name and architecture automatically when there's no `bpick'.
zplug ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zplug load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zplugin
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: http://zdharma.org/zplugin/wiki/Compiling-programs
zplug ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zplug light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zplug ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplug light tj/git-extras

#zplug snippet 'OMZ::lib/completion.zsh'
zplug snippet 'OMZ::lib/compfix.zsh'
zplug load "zsh-users/zsh-completions"
zplug load "chrissicool/zsh-256color"

#github
zplug snippet 'OMZ::plugins/github/github.plugin.zsh'
zplug snippet 'OMZ::plugins/git/git.plugin.zsh'
#history
zplug light zsh-users/zsh-history-substring-search
#fast-syntax-highlighting
zplug light zdharma/fast-syntax-highlighting
#zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#zsh-completions
#fpat=(~/.zsh/zsh-completions/src $fpath)
zplug light paulirish/git-open
zplug light mollifier/cd-gitroot
autoload -Uz cd-gitroot


#neovim
alias vi='nvim'

#Browser
export BROWSER="/usr/bin/google-chrome-stable"

#Go bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


#ls 
alias ll='ls -la'

#update
alias up='sudo apt update -y && sudo apt upgrade -y'

#LTE
alias lteup='sh ~/.init/script/lte_mineo_start.sh'
alias ltedown='sh ~/.init/script/lte_mineo_stop.sh'
alias lte='sh ~/.init/script/lte.sh'

#cd-gitroot
alias c='cd-gitroot'

#shimachan
alias shimachan='firefox http://dogwood.is.oit.ac.jp/'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### End of Zinit's installer chunk
