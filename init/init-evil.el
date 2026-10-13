; init-evil.el -*- lexical-binding: t; -*-
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  ;; Set initial state for shell modes AFTER evil loads
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(dolist (hook '(shell-mode-hook eshell-mode-hook term-mode-hook))
  (add-hook hook #'turn-off-evil-mode))

(provide 'init-evil)
