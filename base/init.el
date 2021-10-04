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

;; Add terminal launch shortcuts
(defconst terminal-name "gnome-terminal")

(defun terminal ()
  (interactive)
  (shell-command terminal-name) )

(defun files()
(defconst files-name "nautilus")
  (interactive)
  (shell-command files-name) )

(setq doc-view-continuous t)
(setq doc-view-resolution 200)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
    
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 2)

(display-line-numbers-mode)
(load-theme 'tsdh-light)

(global-tab-line-mode t)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-separator "")

(display-line-numbers-mode)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)
