#!/usr/bin/bash

echo "Installing Kuma editor..."

cp -r ./i_man/ ~/.emacs.d/
cp init.el ~/.emacs.d/init.el

while true; do
    read -p "Do you wish to add the alias 'e' for the emacs? " yn
    case $yn in
        [Yy]* ) echo 'alias e=emacs' >> ~/.bashrc; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Done."
