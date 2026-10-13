; init-rust.el -*- lexical-binding: t; -*-
(use-package rust-mode)

(use-package eglot
  :ensure nil
  :hook (rust-mode . eglot-ensure)
  :config
  (setq eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
  (setq-default eglot-workspace-configuration
                '(:rust-analyzer (:check (:command "clippy")
                                  :cargo (:allFeatures t)))))

(add-hook 'eglot-managed-mode-hook
          (lambda () (add-hook 'before-save-hook #'eglot-format-buffer nil t)))

(provide 'init-rust)
