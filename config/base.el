(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'yasnippet)
(yas-global-mode 1)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))

(unless (package-installed-p 'company-box)
  (package-install 'company-box))

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-tree)
(global-undo-tree-mode)

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

;; Add software launch shortcuts
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

;; Disable long lines
(setq-default truncate-lines nil)

;; Bind 'dired' to F1 key
(defun launch-dired ()
  "Lanuches Dired in antoher frame."
  (interactive)
  (dired ".")
  )

(global-set-key [f4] 'launch-dired)

(setq margins-enabled nil)
(defun set-margins ()
  (interactive)
  (if margins-enabled
  (progn margins-enabled
    (setq-default left-margin-width 0 right-margin-width 0)
    (set-window-buffer nil (current-buffer))
    (setq margins-enabled nil)
    )
  (progn 
    (setq-default left-margin-width 35 right-margin-width 35)
    (set-window-buffer nil (current-buffer))
    (setq margins-enabled t)
    ))
  )
