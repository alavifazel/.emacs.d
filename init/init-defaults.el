; init-defaults.el -*- lexical-binding: t; -*-
(setq make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(electric-pair-mode 1)
(recentf-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(provide 'init-defaults)

; saving session
(setq desktop-path (list user-emacs-directory)
      desktop-save t
      desktop-auto-save-timeout 30
      desktop-restore-eager 10
      desktop-load-locked-desktop t)

;; Enable saving only after startup, so nothing is restored automatically.
(add-hook 'emacs-startup-hook (lambda () (desktop-save-mode 1)))

(defun my/restore-session ()
  "Restore the last saved Emacs session."
  (interactive)
  (desktop-read))
