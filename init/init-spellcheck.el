; First install a spell
; sudo apt install aspell aspell-en

(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'flyspell-mode)

(provide 'init-spellcheck)
