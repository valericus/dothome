export PATH="$PATH:/home/vr/bin"
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/

=() {
    if calc=`python3 -c "from math import *; print(${@//x/*})" 2>/dev/null`
    then
        echo $calc
    else
        echo Error >&2
    fi
}

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

alias clipboard='xsel -b'

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

#if [[ ${EUID} == 0 ]] ; then
#  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
#else
#  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
#fi

PS1='[⌛️ ${timer_show}s] [\[\033[01;32m\]\u@\h\[\033[00m\]] [\[\033[01;34m\]\w\[\033[00m\]] ☢ '
