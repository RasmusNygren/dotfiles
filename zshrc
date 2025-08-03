export PATH=$HOME/.local/share/bob/nvim-bin:$HOME/.local/bin:$HOME/go/bin:$HOME/bin:$HOME/.cargo/bin:/bin:/usr/bin:/usr/local/bin:/usr/lib/jdk-17.0.8+7/bin:${PATH}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="risto"
KUBE_EDITOR="nvim"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Aliases
alias lsstd="ls --color=auto"
alias ls="eza"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias stdvim="vim" 
alias cl="clear"
alias cdf="cd_with_fzf_from_pwd"
alias cdfh="cd_with_fzf_from_home"
alias open="open_with_fzf_from_pwd"
alias openh="open_with_fzf_from_home"
alias mv="mv -i"
alias cp="cp -i"
alias gtree="git ls-tree -r --name-only HEAD | tree --fromfile"

alias gs="git status"


alias goproxyon="go env -w GOPROXY='https://artifactory.trioptima.net/artifactory/go|https://proxy.golang.org,direct'"
alias goproxyoff="go env -w GOPROXY='https://proxy.golang.org,direct'"
alias docker-rm-all="docker rm $(docker ps -a -q)"
alias mountnetwork="sudo mount -t cifs //pintfs2.trioptima.local/Common -o username=$(id -u -n),uid=$(id -u),vers=3.0 /mnt/trioptima/common"

alias tmdev="source os-login tm-dev"
alias tmuat="source os-login tm-uat tm-dev"
alias tmprod="source os-login tm-prod tm-dev"

alias tsdev="source os-login trisettle-dev"
alias tsuat="source os-login trisettle-uat trisettle-dev"
alias tsprod="source os-login trisettle-prod trisettle-dev"
alias tsdr="source os-login trisettle-dr trisettle-dev"


alias prune-merged-branches="git branch --merged | grep -i -v 'master' | xargs git branch -d"

# Alias for typos
alias kbuectl="kubectl"


# alias sstc="import png:- | xclip -selection clipboard -t image/png"


# Scripts
open_with_fzf_from_pwd() {
    fd -t f -H -I | fzf -m | (xargs -r -d "\n" xdg-open 2>&- &)
}
open_with_fzf_from_home() {
    cd $HOME && fd -t f -H -I | fzf -m | (xargs -r -d "\n" xdg-open 2>&- &)
}
cd_with_fzf_from_pwd() {
    cd "$(fd -t d -H -I | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
cd_with_fzf_from_home() {
    cd $HOME && cd "$(fd -t d -H -I | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

os_login_info() {
    if [[ -n "${OS_PROJECT_NAME}" && -n ${OS_TOKEN} ]]; then
        echo "%F{yellow}%B[${OS_PROJECT_NAME}] %f%b"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval $(keychain --eval --quiet id_ed25519)

PROMPT='$(os_login_info)'$PROMPT
