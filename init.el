; init.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

;; Customize junk stays out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'init-packages)   ; must come first, sets up package + use-package
(require 'init-ui)
(require 'init-defaults)
(require 'init-evil)
(require 'init-treemacs)
(require 'init-rust)
(require 'init-del-mode)
(require 'init-latex)
(require 'init-templates)
(require 'init-spellcheck)
(require 'init-pomo)

(defun my/eshell-setup ()
  (local-set-key (kbd "RET") #'eshell-send-input)
  (local-set-key (kbd "<return>") #'eshell-send-input))

(add-hook 'eshell-mode-hook #'my/eshell-setup)
