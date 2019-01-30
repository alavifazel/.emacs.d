This is my optimal Emacs config. Some of the main configs are as follows: 

* CuaMode enabled (cutting/copying/pasting is done with shortcuts presented in most softwares).
* <C-k> doesn't cut the text, it deletes it (same as in terminals).
* <M-k> acts like <C-k> but backwards (it deletes text from cursor to beginning of a line).
* <C-w> deletes the previous word (same as in Vim and terminals).
* auto-complete enabled (mainly for C++).
* No auto-generated backup files (cleaner working tree directory).
* neoTree enabled (can be toggled with F8).
* Compile/Run command bound to F4 key.
* Line numbering enabled.

## Installation
If you're using Linux/Mac, run the *installer.sh*. It will **overwrite** your Emacs config with this one. If you're using Windows, manually copy the init.el to your config directory. Next, restart Emacs and answer the questions with 'y' to install necassary packages.