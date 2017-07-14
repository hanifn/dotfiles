# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew composer laravel thefuck python vagrant)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# Powerline settings
POWERLINE_DETECT_SSH="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/python/easy_install:/usr/local/sbin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# fix for missing powerline.vim in vim
if test -z "${POWERLINE_CONFIG_COMMAND}" ; then
    if which powerline-config >/dev/null ; then
        POWERLINE_CONFIG_COMMAND=powerline-config
    else
        POWERLINE_CONFIG_COMMAND="/usr/local/bin/powerline-config"
        #POWERLINE_CONFIG_COMMAND="$_POWERLINE_SOURCED:h:h:h:h/scripts/powerline-config"
    fi
fi

# Find pip repository dir
PIP_REPO="$(pip show powerline-status | grep 'Location' | awk '{ print $2 }')"
. $PIP_REPO/powerline/bindings/zsh/powerline.zsh

# add composer path
export PATH=$HOME/.composer/vendor/bin:$PATH

# add postgres.app path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# add mysql path
export PATH=/usr/local/mysql/bin:$PATH

export NVM_DIR="/Users/hanifnorman/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# add golang path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# SP network proxy settings
export http_proxy=`scutil --proxy | awk '\
  /HTTPEnable/ { enabled = $3; } \
  /HTTPProxy/ { server = $3; } \
  /HTTPPort/ { port = $3; } \
  END { if (enabled == "1") { print "http://" server ":" port; } }'`
if [ "${http_proxy}" != "" ] ; then
  export HTTP_PROXY="${http_proxy}"
  export https_proxy="${http_proxy}"
  export HTTPS_PROXY="${http_proxy}"
  export no_proxy="*.local, 169.254/16, 10.*, localhost, *.in.spdigital.io, auth.singaporepower.com.sg"
  export NO_PROXY="${no_proxy}"
fi
