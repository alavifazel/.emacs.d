; needs clangd install with:
; sudo apt install clangd
;(use-package eglot
;  :ensure nil
;  :hook ((c-mode c++-mode c-ts-mode c++-ts-mode) . eglot-ensure)
;  :config
;  (add-to-list 'eglot-server-programs
;               '((c-mode c++-mode c-ts-mode c++-ts-mode)
;                 . ("clangd" "--background-index" "--clang-tidy"
;                    "--completion-style=detailed"))))

(use-package eglot
  :ensure nil
  :hook ((c-mode c++-mode c-ts-mode c++-ts-mode) . eglot-ensure)
  :config
  (setq eglot-events-buffer-config '(:size 0))  ; Emacs 29.4+/30; use eglot-events-buffer-size 0 on older
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode c-ts-mode c++-ts-mode)
                 . ("clangd" "--background-index" "-j=4"
                    "--completion-style=bundled"
                    "--header-insertion=never"))))

(provide 'init-cpp)
