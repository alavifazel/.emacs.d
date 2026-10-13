; init-ui.el -*- lexical-binding: t; -*-
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(use-package doom-themes
  :config (load-theme 'doom-one t))

(provide 'init-ui)
