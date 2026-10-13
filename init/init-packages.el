; init-packages.el -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vertico :init (vertico-mode))
(use-package orderless :custom (completion-styles '(orderless basic)))
(use-package marginalia :init (marginalia-mode))
(use-package which-key :init (which-key-mode))
(use-package magit)
(use-package company :hook (prog-mode . company-mode))

(provide 'init-packages)
