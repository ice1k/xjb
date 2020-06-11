# ~/.bashrc: executed by bash(1) for non-login shells.
case $- in
    *i*) ;;
    *) return;;
esac
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
				color_prompt=yes
    else
				color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.tokens ]; then
    . ~/.tokens
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
fi

PS1="\[\033[34m\]\w\[\033[0m\]\[\033[20m\]\$(__git_ps1 '|%s')\[\033[0m\] \[\033[33m\]λ>\[\033[0m\] "

alias ec="emacsclient -nw"
alias en="emacs -nw"
alias ecw="emacsclient --c"
alias coffee-machine="emacsclient -nw"

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64

export SDK=~/SDK

export PATH=~/.sdkman/candidates/kotlin/current/bin:$PATH
export PATH=~/.sdkman/candidates/gradle/current/bin:$PATH
export PATH=$SDK/zig:$PATH
export PATH=$SDK/depot_tools:$PATH
export PATH=$SDK/flutter/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH=/opt/ghc/bin:$PATH
export PATH=/opt/cabal/bin:$PATH
export PATH=$SDK/flutter/bin/cache/dart-sdk/bin:$PATH
export PATH=$SDK:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=$SDK/Isabelle2017/bin:$PATH
export PATH=$SDK/Isabelle2017:$PATH

export ANDROID_HOME=$SDK/tools

export AGDA_STDLIB=$SDK/agda-stdlib
export AGDA_HOME=~/.cabal/share/x86_64-linux-ghc-8.2.1/Agda-2.5.3/lib/prim

export ISABELLE_HOME=$SDK/Isabelle2017

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
