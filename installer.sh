#!/usr/bin/bash

echo "Applying the config..."

cp ./base/init.el ~/.emacs.d/
cp -r ./base/iscripts ~/.emacs.d/

while true; do
    read -p "Do you wish to add the alias 'e' for the emacs? " yn
    case $yn in
        [Yy]* ) echo 'alias e=emacs' >> ~/.bashrc; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Done."
