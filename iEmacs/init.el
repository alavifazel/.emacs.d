(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/")))

;; Load config files
(load-scripts "config/base.el")
(load-scripts "config/org_config.el")

;; Add IJava (only when the java-mode is on)
(defun add-ijava ()
    (load-scripts "iscript/java.el") )

(advice-add 'java-mode :before #'add-ijava)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(org-file-apps
   '(("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")
     (auto-mode . emacs)))
 '(package-selected-packages '(company evil)))
(custom-set-faces
 '(highlight ((t (:background "#454545" :foreground "#ffffff" :underline nil)))))
