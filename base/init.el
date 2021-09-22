(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (company evil))))
(custom-set-faces)
(add-hook 'after-init-hook 'global-company-mode)

(electric-pair-mode t)
(load-theme 'wombat)
(show-paren-mode 1)

;; Move them to Java major mode
(defun sti ()
  "Convert String to Integer."
  (interactive)
  (insert "Integer.parseInt();")
  (backward-char 2))

(defun its ()
  "Convert Integer to String."
  (interactive)
  (insert "String.valueOf();")
  (backward-char 2))

(transient-mark-mode 1)
(defun gs ()
  "Generate getters/setter."
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
