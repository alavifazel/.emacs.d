(setq pkgs '(
       key-chord
       undo-tree
       company
       elpy
       python-mode
       jedi
       flycheck
       lsp-mode
       go-mode
       ))

(linum-mode 1)

(require 'package)
(require 'cl)

(defun load-script (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/")))

;; Add IJava only when the java-mode is on
(defun add-ijava ()
    (load-script "iscript/java.el"))

(defun add-ipython ()
    (load-script "iscript/python.el"))

(defun install (required-pkgs)
  (setq pkgs-to-install
      (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
        (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))

  (when (> (length pkgs-to-install) 0)
    (package-refresh-contents)
   (dolist (pkg pkgs-to-install)
    (package-install pkg))))

(defun emacs-initialize ()
  (require 'package)
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "https")))
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t ))
  
;; Install missing packages
(install pkgs)

;; Cua mode
(cua-mode t)

;; Load config files
(load-script "config/base.el")
(load-script "config/org-config.el")
(load-script "config/org-timer.el")
(load-script "config/go.el")

(advice-add 'java-mode :before #'add-ijava)
(advice-add 'python-mode :before #'add-ipython)

(custom-set-variables
 '(inhibit-startup-screen t)
 '(org-file-apps
   '(("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")
     (auto-mode . emacs)))
 '(package-selected-packages '(evil emmet-mode company))))

(emacs-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-file-apps
   '(("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")
     (auto-mode . emacs)))
 '(package-selected-packages
   '(solarized-theme go-mode eglot list-packages-ext flycheck-golangci-lint key-chord yasnippet-snippets lsp-mode js2-mode company-posframe jedi python-mode flycheck ## elpy company-jedi web-mode company-phpactor company-php php-mode evil emmet-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
