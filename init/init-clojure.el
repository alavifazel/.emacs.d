; init-clojure.el -*- lexical-binding: t; -*-
; needs the Clojure CLI or Leiningen, and optionally clojure-lsp:
; sudo apt install clojure leiningen
; (clojure-lsp: https://clojure-lsp.io/installation/)

(use-package clojure-mode)

(use-package cider
  :custom
  (cider-repl-display-help-banner nil)
  (cider-repl-pop-to-buffer-on-connect 'display-only)
  (cider-save-file-on-load t)
  (cider-show-error-buffer 'only-in-repl))

;; Language server (optional, skipped quietly if clojure-lsp is not installed)
(use-package eglot
  :ensure nil
  :hook (((clojure-mode clojurescript-mode clojurec-mode) . my/clojure-eglot-maybe))
  :config
  (add-to-list 'eglot-server-programs
               '((clojure-mode clojurescript-mode clojurec-mode) . ("clojure-lsp"))))

(defun my/clojure-eglot-maybe ()
  (when (executable-find "clojure-lsp")
    (eglot-ensure)))

(provide 'init-clojure)
