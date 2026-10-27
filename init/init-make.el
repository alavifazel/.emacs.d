; init-make.el -*- lexical-binding: t; -*-

(setq compilation-scroll-output 'first-error
      compilation-ask-about-save nil) ; save buffers automatically before running

(defun make (&optional target)
  "Run `make' using the Makefile of the current project.
Looks upwards from the current directory for a Makefile, falling back to
the project root. With a prefix argument, prompt for the make target.
Output is shown in the *compilation* buffer."
  (interactive
   (list (when current-prefix-arg (read-string "make target: "))))
  (let* ((dir (or (locate-dominating-file default-directory "Makefile")
                  (locate-dominating-file default-directory "makefile")
                  (locate-dominating-file default-directory "GNUmakefile")
                  (when-let ((proj (project-current)))
                    (project-root proj)))))
    (unless dir
      (user-error "No Makefile found in this directory or any parent"))
    (let ((default-directory dir))
      (compile (if (and target (not (string-empty-p target)))
                   (concat "make " (shell-quote-argument target))
                 "make")))))

(provide 'init-make)
