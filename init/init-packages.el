; init-packages.el -*- lexical-binding: t; -*-
(require 'package) ; loads Emacs default package so its functions used below are avaiable
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) ; The final t appends it at the end of the list so that ELPA gets priority over MELPA
(package-initialize) ; Scans ELPA and makes the already-installed packages available to load

(require 'use-package)
(setq use-package-always-ensure t) ; if package isnt installed, download it.

(use-package vertico :init (vertico-mode)) ; vertico is an autocompletion (vertical) package for the minibuffer. We use :init to enable the package. use-package by itself doesn't do that
(use-package orderless :custom (completion-styles '(orderless basic)))
(use-package marginalia :init (marginalia-mode))
(use-package which-key :init (which-key-mode))
(use-package magit) ; no need to :init for this. because there is no mode to turn it. it's just a set of commands 
(use-package company :hook (prog-mode . company-mode)) ; :hook (x . y) means whenver the the prog-mode is enabled, enable copmany mode

(provide 'init-packages)
