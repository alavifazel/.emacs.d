; init-ui.el -*- lexical-binding: t; -*-
(setq inhibit-startup-screen t)
; (menu-bar-mode -1) THIS LINE CAUSED BAD TEXT RENDER!

; enabling smooth scrolling
(setq scroll-step 1 
      scroll-conservatively 101
      scroll-preserve-screen-position t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(load-theme 'manoj-dark)

(provide 'init-ui)
