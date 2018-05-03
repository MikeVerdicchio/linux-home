# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

function setup_ssh() {
	ssh-keygen -t rsa -b 4096 -C "mikeverdicchio@gmail.com"
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub
}

function httpdiff() {
    diff -u <(curl -sS -D - -L $1) <(curl -sS -D - -L $2) | colordiff
}

function update() {
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y
}

function install_packages() {
	update
	xargs -a <(awk '! /^ *(#|$)/' "$1") -r -- sudo apt-get install
}
