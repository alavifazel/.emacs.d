#!/usr/bin/bash

echo "Applying the config..."

cp ./init.el ~/.emacs.d/

echo 'stty susp undef' >> ~/.bashrc

while true; do
    read -p "Do you wish to add the alias 'e' for the emacs? " yn
    case $yn in
        [Yy]* ) echo 'alias e=emacs' >> ~/.bashrc; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Done."
