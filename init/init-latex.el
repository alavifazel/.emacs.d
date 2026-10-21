(use-package pdf-tools
  :ensure t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (add-hook 'pdf-view-mode-hook
            (lambda () (display-line-numbers-mode -1))))

(use-package tex
  :ensure auctex
  :defer t
  :hook ((LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . turn-on-cdlatex)
         (LaTeX-mode . visual-line-mode)
         (LaTeX-mode . (lambda () (setq TeX-command-default "LatexMk"))))
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-PDF-mode t
        TeX-source-correlate-mode t
        TeX-source-correlate-start-server t
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        reftex-plug-into-AUCTeX t)
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer))

(use-package auctex-latexmk
  :ensure t
  :after tex
  :config
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  (auctex-latexmk-setup))

(use-package cdlatex :ensure t)

(use-package evil-tex
  :ensure t
  :hook (LaTeX-mode . evil-tex-mode))

;; Hide native-compiler noise
(setq native-comp-async-report-warnings-errors 'silent)


(provide 'init-latex)
