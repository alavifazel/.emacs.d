(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defun sti ()
  "Convert String to Integer."
  (when (eq major-mode 'java-mode))
  (interactive)
  (insert "Integer.parseInt();")
  (backward-char 2))

(defun its ()
  "Convert Integer to String."
  (when (eq major-mode 'java-mode))
  (interactive)
  (insert "String.valueOf();")
  (backward-char 2))

(defun gs ()
  "Generate getters/setter."
  (when (eq major-mode 'java-mode))
  (interactive)
  (setq region-str (buffer-substring-no-properties (region-beginning) (region-end)))
  (save-match-data
    (and (string-match ".*\\([[:space:]].*[^[:space:]]\\)[[:space:]]*\\([[:space:]].*\\);$" region-str)
	 (setq gs-type-p (match-string 1 region-str)
	       gs-var-p (match-string 2 region-str))))
  (setq gs-type (substring-no-properties gs-type-p 1 nil))
  (setq gs-var (substring-no-properties gs-var-p 1 nil))
  (print gs-type)
  (goto-char (region-end))

  (insert "\n\n")
  (insert (concat "public " gs-type " " "get" (capitalize gs-var) "(" gs-type " " gs-var ") { \n" ))
  (insert (concat "\t" "return this." gs-var ";\n"))
  (insert "}\n")

  (insert "\n")
  (insert (concat "public void set" (capitalize gs-var) "(" gs-type " " gs-var ") { \n" ))
  (insert (concat "\t" "this." gs-var " = " gs-var ";\n"))
  (insert "}\n") )
