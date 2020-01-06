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

setopt  autocd autopushd pushdignoredups
d() { dirs -v; }

bindkey "^Q" up-line-or-search

bindkey "^R" history-incremental-search-backward
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

b() { bindkey |v- }

# { . $RCROOT/zsh.complete & } &>/dev/null 
. $RCROOT/zsh.complete

unalias run-help 2>/dev/null
autoload run-help
bindkey "^[h" run-help
alias rh=run-help
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
# compdef _run-help vh
compdef _functions vh
vh() {
    # case "$(whence -v $1)" in *"function from"*) whence -v "$1" | vim -;; esac
    whence -v "$1" | grep "function from" && whence -v "$1" | vim -c 'set noswapfile | norm f/gf' - || run-help "$1";
    # whence -v "$1" | grep "function"
    # && whence -v "$1" | vim - || run-help "$1";
}

fu() { functions "$1"; }



export ip0=155.138.229.11
# r ~/.ssh/config
fa() {
bash <<'EOF'
f() { echo >/dev/tcp/${2-$ip0}/$1 && echo "port $1 is open" || echo "port $1 is closed"; }
fa() {
ports=$(python -c '
import json, sys
x = json.loads(sys.stdin.read())
print(" ".join(x["port_password"].keys()))
' < "$RCROOT/../lib/shadowsocks/run/shadowsocks.json"
)
for i in $ports; do f "$i" "$@"; done
}
fa
EOF
}

sspull() {
    (cd "$RCROOT/../shadowsocks/run" && scp vpn:/etc/shadowsocks.json . )
}
