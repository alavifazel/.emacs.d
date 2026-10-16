; Providing the template by creating a new dir
; (defun my/new-beamer (dir)
;   "Create DIR with slides.tex from the Beamer template and open it."
;   (interactive "DNew project directory: ")
;   (make-directory dir t)
;   (let ((file (expand-file-name "slides.tex" dir)))
;     (copy-file (expand-file-name "~/.emacs.d/templates/beamer.tex") file)
;     (find-file file)))

; Creates the tempalte file(s) in the same dir.
; We need (interactive) to make it a command.
; Also passing 'default-directory' was needed to specify we want to create the files in the same dir.

(defun my/new-beamer ()
  "Create slides.tex in the current directory from the Beamer template."
  (interactive)
  (let ((file (expand-file-name "slides.tex" default-directory)))
    (copy-file (expand-file-name "~/.emacs.d/templates/beamer.tex") file)
    (find-file file)))

(defun my/new-beamer-slide ()
  "Insert the Beamer template at point."
  (interactive)
  (insert-file-contents (expand-file-name "~/.emacs.d/templates/new_beamer_slide.tex")))


(provide 'init-templates)
