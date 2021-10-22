# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tags
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

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
#zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit

#plugin add
# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zplugin will
# grep operating system name and architecture automatically when there's no `bpick'.
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zplugin
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: http://zdharma.org/zinit/wiki/Compiling-programs
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zinit light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras

#zinit snippet 'OMZ::lib/completion.zsh'
zinit snippet 'OMZ::lib/compfix.zsh'
zinit load "zsh-users/zsh-completions"
zinit load "chrissicool/zsh-256color"

#github
zinit snippet 'OMZ::plugins/github/github.plugin.zsh'
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
#history
zinit light zsh-users/zsh-history-substring-search
#fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting
#zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#zsh-completions
#fpat=(~/.zsh/zsh-completions/src $fpath)
zinit light paulirish/git-open
zinit light mollifier/cd-gitroot
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


PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)%{${reset_color%}%} "
