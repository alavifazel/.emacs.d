(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(electric-pair-mode t)
(load-theme 'adwaita)
(show-paren-mode 1)

;; Disables the bell sound
(setq ring-bell-function 'ignore)

(custom-set-variables
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (company))))
(custom-set-faces)
(add-hook 'after-init-hook 'global-company-mode)

(setq doc-view-continuous t)
(setq doc-view-resolution 200)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 2)

(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-separator "")

(setq scroll-conservatively 101)

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
;; (custom-set-variables
;;  '(inhibit-startup-screen t)
;;  '(package-selected-packages '(company)))
;; (custom-set-faces
;;  '(highlight ((t (:background "#454545" :foreground "#ffffff" :underline nil)))))

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
(setq scroll-conservatively 1000)
