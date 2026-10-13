; init-treemacs.el -*- lexical-binding: t; -*-
(use-package treemacs
  :defer t
  :bind (("<f8>" . treemacs)
         ("<f7>" . treemacs-select-directory)
         ("C-c t" . treemacs-select-window))
  :custom
  (treemacs-position 'right)
  (treemacs-width 30)
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

(use-package treemacs-evil
  :after (treemacs evil))

(provide 'init-treemacs)
