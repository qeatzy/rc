# vim: ft=bash

a() { echo abc; }
# let g:term = 'zsh'
wh() { which "$@"; }

_trim_PWD() { pp="$PWD/" q=${pp#"$HOME/"} p=${q%?};((${#p}>19))&& psvar[1]="${p[1,9]}…${p[-9,-1]}" || psvar[1]="$p"; }
autoload -Uz add-zsh-hook
add-zsh-hook precmd _trim_PWD
rp () { # refresh prompt
PROMPT="%F{${1:-12}}%v %T %(1j.%j.)%(!.#.$) %(?..%?)%f" # **need 256 color** trimed PWD, time, job number, $, error code
}
rp 13


bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-history
