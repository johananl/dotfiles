DISABLE_MAGIC_FUNCTIONS=true

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Ensure comments are visible on dark backgrounds
typeset -gA ZSH_HIGHLIGHT_STYLES
export ZSH_HIGHLIGHT_STYLES[comment]='none'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Run tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Set PATH (custom)
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin

# Python 3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Azure CLI
export PATH=$PATH:~/bin

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Contains stuff I don't want to commit to a public repo
#source ~/.zshrc_local

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git show"
alias gai="git add -i"
alias gcob="git checkout -b"
alias gbv="git branch -vvvv"
alias kc="kubectl"
alias kcnk='kubectl -n kube-system'
alias tf="terraform"
alias gdca="git diff --cached --color=always"
alias gdl="git diff --color=always | less -r"
alias gdcal="git diff --cached --color=always | less -r"
alias vi='vim'
alias gitwhen='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias myip="curl -s ipinfo.io | jq -r '.ip'"
alias xc='xclip'
alias xco='xclip -o'
alias spotify='spotify --force-device-scale-factor=2'
alias display-home='eval $(display-external 2560x1440 1.5)'
alias display-laptop='eval $(display-builtin)'
alias screenshot='flameshot gui -d 2000'
alias lh='ls -alh'
alias gc='git commit -v -s'

# Functions
# Generate a random word for passphrases
dice () {
    for i in {1..$1}; do
        curl -s https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt \
        | grep $(python -c "import random; print(''.join(map(str, [random.randint(1,6) for x in range(5)])))") \
        | awk '{print $2}'
    done
}

# Disable shared history
unsetopt share_history

# Move one word forward / backword
bindkey "[D" backward-word
bindkey "[C" forward-word

# ZSH syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use vim as an editor
export EDITOR=vim

# Vault autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# kubectl completion
source <(kubectl completion zsh)
complete -F __start_kubectl kc

# Azure CLI completion
#source '/home/johannes/lib/azure-cli/az.completion'
