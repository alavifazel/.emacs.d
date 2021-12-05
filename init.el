(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/")))

;; Load config files
(load-scripts "config/base.el")
(load-scripts "config/org-config.el")
(load-scripts "config/org-timer.el")

;; Add IJava only when the java-mode is on
(defun add-ijava ()
    (load-scripts "iscript/java.el") )

(advice-add 'java-mode :before #'add-ijava)
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
     (auto-mode . emacs)) t)
 '(package-selected-packages '(god-mode company-box undo-tree company evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#454545" :foreground "#ffffff" :underline nil)))))
