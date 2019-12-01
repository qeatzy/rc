# vim: ft=bash

if [ -n "$RUNZSH" -a "$DEPTH" -lt 2 ]; export ZDOTDIR="$RCROOT"; then exec zsh; fi

# let $BASH_ENV='/cygdrive/e/nnotes/dev/rc/lib/bash/profile'
# echo $BASH_ENV

# PS1='\e[1;34m$ \A $(anyjobs \j)\$ \e[m' # none if $HOME, ${t%?} to remove last char of string t. 

a() { echo ab; }
# let g:term='bash --rcfile /cygdrive/e/nnotes/dev/rc/lib/bash/profile'

_trim_PWD_anyjobs() {
pp="$PWD/"
q=${pp#"$HOME/"}
p=${q%?}
((${#p}>19)) && p="${p::9}…${p:(-9)}"
[ "$2" -gt 0 ] && p="$p $1 $2" || p="$p $1 "
echo "$p"
}


# prompt setting
anyjobs() { [[ "$1" != 0 ]] && echo "$1"; } # https://unix.stackexchange.com/a/446149/202329
rp () { # refresh prompt
# PS1="\e[38;5;${1:-1}m"'$(pp="$PWD/" q=${pp#"$HOME/"} p=${q%?};((${#p}>19))&&echo "${p::9}…${p:(-9)}"||echo "$p") \A $(anyjobs \j)\$ '"\e[m" # none if $HOME, ${t%?} to remove last char of string t. 
PS1="\e[38;5;${1:-1}m"'$(_trim_PWD_anyjobs \A \j)\$ '"\e[m" # none if $HOME, ${t%?} to remove last char of string t. 
}
rp 2

# x=bc/def
# case $x in /*) ;; *) y="$PWD/${x%/*}" ;; esac
# echo "$y"
# # https://stackoverflow.com/questions/3572030/bash-script-absolute-path-with-os-x
# # https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
