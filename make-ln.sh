#!/usr/bin/env sh

HOMEFILES="gitconfig vimrc bashrc bash_profile"

LN_CMD="ln -s"
if [ "$1" = "-f" ]; then
    echo "Forcing..."
    LN_CMD="$LN_CMD -f"
fi

dir=`pwd`

for file in $HOMEFILES; do
    $LN_CMD $dir/config/$file $HOME/.$file
done

mkdir -p $HOME/.ssh
if [ -z "`grep york /etc/resolv.conf`" ]; then
    $LN_CMD $dir/config/ssh-config $HOME/.ssh/config
else
    $LN_CMD $dir/config/ssh-config-yk $HOME/.ssh/config
fi
