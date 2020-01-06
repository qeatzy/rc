
case $PATH in */pkg/bin) ;; *) export PATH="$HOME/pkg/bin:$PATH"; esac
ZDOTDIR="$HOME/.vim/rc/bash"; . "$ZDOTDIR/profile"; return $?

