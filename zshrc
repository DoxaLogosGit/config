# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git github go docker sbt scala celery pip python virtualenv fabric vi-mode tmux screen cp colorize colored-man dirhistory)

# User configuration

export PATH="$PATH:/home/jatkinso/gradle-1.11/bin:/usr/lib/ccache:/usr/lib/ccache/bin:/home/jatkinso/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/packer"
# export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH=$PYTHONPATH:/home/jatkinso/workdrive/Projects/package/PackageTools/MoveToBeta/src
export P4CLIENT=jatkinso_ssd_space
export P4USER=jatkinso 
export P4PORT=p4-cn-srv:1666
export P4IGNORE=~/.p4ignore
export GHS_LMWHICH=ghs
export GHS_LMHOST=corp-licmgr.adtran.com
export GRADLE_HOME=/home/jatkinso/gradle-1.11
export PATH=$GRADLE_HOME/bin:/usr/lib/ccache:$PATH
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.5 


# GHS old compiler workaround
LD_LIBRARY_PATH=/usr/ghs/safecpy_preload/\$LIB
LD_PRELOAD=safecpy.so
export PIP_EXTRA_INDEX_URL=http://pypi.adtran.com/simple
export KEYTIMEOUT=1
export P4IGNORE=~/.p4ignore


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

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
