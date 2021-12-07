(defun org-front-matter ()
  (interactive)
  (goto-line 0)
  (insert "#+title: " "\n")
  (insert "#+author: " user-name "\n")
  (insert "#+lastmod: ")
  (org-time-stamp-inactive t)
  (insert "\n")
  (insert "#+categories[]: " "misc" "\n")
  (insert "#+draft: " "true" "\n")
  (insert "\n")
  (goto-line 0)
  (goto-char (line-end-position))
  )

(setq org-file-apps
'(("\\.docx\\'" . default)
    ("\\.mm\\'" . default)
    ("\\.x?html?\\'" . default)
    ("\\.pdf\\'" . "evince %s")
    (auto-mode . emacs)))

(local-set-key "\M-\C-g" 'org-plot/gnuplot) 
