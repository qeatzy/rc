# vim: ft=bash

a() { echo abc; }
# let g:term = 'zsh'
wh() { which "$@"; }

[ -n $depth ] && . "$RCROOT/profile.interactive.zsh.nested"

_trim_PWD() { pp="$PWD/" q=${pp#"$HOME/"} p=${q%?};((${#p}>19))&& psvar[1]="${p[1,9]}…${p[-9,-1]}" || psvar[1]="$p"; }
autoload -Uz add-zsh-hook
add-zsh-hook precmd _trim_PWD
rp () { # refresh prompt
PROMPT="%F{${1:-12}}%v %T %(1j.%j.)%(!.#.$) %(?..%?)%f" # **need 256 color** trimed PWD, time, job number, $, error code
}
rp 13

# { . $RCROOT/zsh.complete & } &>/dev/null 
. $RCROOT/zsh.complete

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-history
bindkey "^[." insert-last-word
bindkey "^U" backward-kill-line
bindkey "^K" kill-line
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey "^F" forward-char
bindkey "^B" backward-char
bindkey "^[b" backward-word
bindkey "^[f" forward-word

