(package-initialize)

(setq pkgs '(
       company
       evil
       ))

(require 'package)
(require 'cl)

(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/")))

;; Add IJava only when the java-mode is on
(defun add-ijava ()
    (load-scripts "iscript/java.el") )

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

  ;; Load config files
  (load-scripts "config/base.el")
  (load-scripts "config/org-config.el")
  (load-scripts "config/org-timer.el")

  (advice-add 'java-mode :before #'add-ijava)
  (custom-set-variables
   '(inhibit-startup-screen t)
   '(org-file-apps
     '(("\\.docx\\'" . default)
       ("\\.mm\\'" . default)
       ("\\.x?html?\\'" . default)
       ("\\.pdf\\'" . "evince %s")
       (auto-mode . emacs)))
   '(package-selected-packages '(evil emmet-mode company)))

  ;; Add IJava only when the java-mode is on
  (defun add-ijava ()
    (load-scripts "iscript/java.el")))

(emacs-initialize)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(org-file-apps
   (quote
    (("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")
     (auto-mode . emacs))))
 '(package-selected-packages (quote (evil emmet-mode company))))
(custom-set-faces)
