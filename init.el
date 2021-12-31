(package-initialize)

(setq pkgs '(
       evil
       undo-tree
       company
       elpy
       python-mode
       jedi
       flycheck
       ))

(require 'package)
(require 'cl)

(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/")))

;; Add IJava only when the java-mode is on
(defun add-ijava ()
    (load-scripts "iscript/java.el"))

(defun add-ipython ()
    (load-scripts "iscript/python.el"))

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

  ;; Evil-mode
  (evil-mode)
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree)
  
  ;; Load config files
  (load-scripts "config/base.el")
  (load-scripts "config/org-config.el")
  (load-scripts "config/org-timer.el")

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
   (quote
    (("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")
     (auto-mode . emacs))))
 '(package-selected-packages
   (quote
    (jedi python-mode flycheck ## elpy company-jedi web-mode company-phpactor company-php php-mode evil emmet-mode company))))
(custom-set-faces)
