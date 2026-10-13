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
