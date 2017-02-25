### ALIASES ###
alias pyserv='python -m SimpleHTTPServer'
alias phpserv='php -S localhost:8005'

### VIEW MOST RECENT COMMANDS ###
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

### REMOVE ICONR FILES  ###
alias rm_icon="find . -name "Icon*" -type f -delete"

### CHECK TEMPERATURE ###
alias check_temp='~/Desktop/osx-cpu-temp/./osx-cpu-temp'

## CLEAN VIEW OF PATH ##
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

## CLOSE APPLICATION ##
function quit {
osascript <<EOF
  tell application "$*" to quit
EOF
}

## CLOSE CLIPBOARD ##
function closepboard {
    eval ps aux | grep '[p]board'| `awk '{ print "kill " $2 }'`
}

### SVN COLORED TERMINAL OUTPUT ###

function svn
{
    # rebuild args to get quotes right
    CMD=
    for i in "$@"
    do
        if [[ "$i" =~ \  ]]
        then
            CMD="$CMD \"$i\""
        else
            CMD="$CMD $i"
        fi
    done

    # pad with spaces to strip --nocol
    CMD=" $CMD "
    CMDLEN=${#CMD}

    # parse disabling arg
    CMD="${CMD/ --nocol / }"

    # check if disabled
    test "$CMDLEN" = "${#CMD}"
    NOCOL=$?
    if [ "$SVN_COLOR" != "always" ] && ( [ $NOCOL = 1 ] || [ "$SVN_COLOR" = "never" ] || [ ! -t 1 ] )
    then
        eval $(which svn) $CMD
        return
    fi

    # supported svn actions for "status-like" output
    ACTIONS="add|checkout|co|cp|del|export|remove|rm|st"
    ACTIONS="$ACTIONS|merge|mkdir|move|mv|ren|sw|up"

    # actions that outputs "status-like" data
    if [[ "$1" =~ ^($ACTIONS) ]]
    then
        eval $(which svn) $CMD | while IFS= read -r RL
        do
            if   [[ $RL =~ ^\ ?M ]]; then C="\033[34m";
            elif [[ $RL =~ ^\ ?C ]]; then C="\033[41m\033[37m\033[1m";
            elif [[ $RL =~ ^A ]]; then C="\033[32m\033[1m";
            elif [[ $RL =~ ^D ]]; then C="\033[31m\033[1m";
            elif [[ $RL =~ ^X ]]; then C="\033[37m";
            elif [[ $RL =~ ^! ]]; then C="\033[43m\033[37m\033[1m";
            elif [[ $RL =~ ^I ]]; then C="\033[33m";
            elif [[ $RL =~ ^R ]]; then C="\033[35m";
            else C=
            fi

            echo -e "$C${RL/\\/\\\\}\033[0m\033[0;0m"
        done

    # actions that outputs "diff-like" data
    elif [[ "$1" =~ ^diff ]]
    then
        eval $(which svn) $CMD | while IFS= read -r RL
        do
            if   [[ $RL =~ ^Index:\  ]]; then C="\033[34m\033[1m";
            elif [[ $RL =~ ^@@ ]]; then C="\033[37m";

            # removed
            elif [[ $RL =~ ^-\<\<\< ]]; then C="\033[31m\033[1m";
            elif [[ $RL =~ ^-\>\>\> ]]; then C="\033[31m\033[1m";
            elif [[ $RL =~ ^-=== ]]; then C="\033[31m\033[1m";
            elif [[ $RL =~ ^- ]]; then C="\033[31m";

            # added
            elif [[ $RL =~ ^\+\<\<\< ]]; then C="\033[32m\033[1m";
            elif [[ $RL =~ ^\+\>\>\> ]]; then C="\033[32m\033[1m";
            elif [[ $RL =~ ^\+=== ]]; then C="\033[32m\033[1m";
            elif [[ $RL =~ ^\+ ]]; then C="\033[32m";

            else C=
            fi

            echo -e "$C${RL/\\/\\\\}\033[0m\033[0;0m"
        done
    else
        eval $(which svn) $CMD
    fi
}
