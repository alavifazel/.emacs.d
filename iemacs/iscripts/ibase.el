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

(setq doc-view-continuous t)
(setq doc-view-resolution 200)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
    
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 2)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(global-tab-line-mode t)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-separator "")

(setq scroll-conservatively 101)
(global-hl-line-mode)

;; Add terminal launch shortcuts
(defconst terminal-name "gnome-terminal")
(defconst files-name "nautilus")

(defun terminal ()
  (interactive)
  (shell-command terminal-name) )

(defun files()
  (interactive)
  (shell-command files-name) )

;; Remove underline when (global-hl-line-mode) is on
(custom-set-variables
 '(inhibit-startup-screen t)
 '(package-selected-packages '(company evil)))
(custom-set-faces
 '(highlight ((t (:background "#454545" :foreground "#ffffff" :underline nil)))))
