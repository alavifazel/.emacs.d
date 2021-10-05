(defun load-scripts (file)
  (interactive)
  (load-file (expand-file-name file "~/.emacs.d/iscripts/")))

;; Load base config file 
(load-scripts "ibase.el")

;; Add IJava only when the java-mode is on
(defun add-ijava ()
    (load-scripts "ijava.el") )

(advice-add 'java-mode :before #'add-ijava)
