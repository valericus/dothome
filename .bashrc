export PATH="$PATH:~/vr/bin:/home/vr/java/apache-maven/bin:~/code/exante-tools/build-helpers"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PYTHONDONTWRITEBYTECODE=1
export GOPATH=~/gocode/

complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

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

alias management-client-prod="javaws http://ci2.ghcg.com/webstart/management-client/management-client-prod.jnlp"
alias management-client-dev="javaws http://ci2.ghcg.com/webstart/management-client/management-client-dev.jnlp"

alias fping="ping -c 50 -q -i 0.2"
alias hping="ping -c 50 -q -i 0.2 -s 1400"

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

PS1='\n╔╣[⌛️ ${timer_show}s] [\[\033[01;32m\]\u@\h\[\033[00m\]] [\[\033[01;34m\]\w\[\033[00m\]]\n╙─► '
PATH="/home/vr/.conscript/bin:$PATH"
