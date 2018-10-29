# Path to your oh-my-zsh installation.
export ZSH=/home/johannes/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Set PATH (custom)
export PATH=$PATH:~/go/bin

# Python 3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

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
alias kc="kubectl"
alias tf="terraform"
alias gdca="git diff --cached --color=always"
alias gdl="git diff --color=always | less -r"
alias gdcal="git diff --cached --color=always | less -r"
alias vi='vim'
alias gitwhen='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias top='top -o cpu'
alias myip="curl -s ipinfo.io | jq -r '.ip'"
alias xc='xclip'
alias xco='xclip -o'

# Functions
# Generate a random word for passphrases
dice () {
    for i in {1..$1}; do
        curl -s https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt \
        | grep $(python -c "import random; print(''.join(map(str, [random.randint(1,6) for x in range(5)])))") \
        | awk '{print $2}'
    done
}

# Start Visual Studio Code in background
code() { nohup /usr/bin/code "$@" > /dev/null 2>&1 & }

# Disable shared history
unsetopt share_history

# Move one word forward / backword
bindkey "[D" backward-word
bindkey "[C" forward-word

# ZSH syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
