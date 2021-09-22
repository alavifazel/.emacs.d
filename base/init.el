(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (company evil))))
(custom-set-faces)
(add-hook 'after-init-hook 'global-company-mode)

(electric-pair-mode t)
(load-theme 'wombat)
(show-paren-mode 1)

(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/iscripts/")))

(defun add-ijava ()
    (load-scripts "ijava.el") )

(advice-add 'java-mode :before #'add-ijava)

