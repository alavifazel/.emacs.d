
					; init-treemacs.el -*- lexical-binding: t; -*-
(use-package treemacs
  :defer t
  :bind (("<f8>" . treemacs)
         ("<f7>" . treemacs-select-directory)
         ("C-c t" . treemacs-select-window))
  :custom
  (treemacs-position 'right)
  (treemacs-width 30)
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)

  (defun my/treemacs--open-terminal (dir)
    "Open GNOME Terminal in DIR."
    (unless (executable-find "gnome-terminal")
      (user-error "gnome-terminal not found"))
    (start-process "gnome-terminal" nil "gnome-terminal"
                   (concat "--working-directory="
                           (expand-file-name dir))))

  (defun my/treemacs-terminal-here ()
    "Open a new eshell in the directory at point in treemacs."
    (interactive)
    (let* ((btn (treemacs-current-button))
           (path (and btn (treemacs-button-get btn :path))))
      (unless path (user-error "Nothing at point"))
      (my/treemacs--open-terminal
       (if (file-directory-p path) path (file-name-directory path)))))

  (defun my/treemacs-rightclick (event)
    "Right-click menu: terminal entry on empty space, default menu on nodes."
    (interactive "e")
    (let* ((pos (event-start event))
           (last (posn-at-point (point-max)))
           (empty (> (cdr (posn-x-y pos))
                     (+ (cdr (posn-x-y last)) (frame-char-height)))))
      (if (not empty)
          (treemacs-rightclick-menu event)
        (select-window (posn-window pos))
        (let ((choice
               (x-popup-menu event
                             '("Treemacs"
                               ("Directory"
                                ("Open terminal here" . terminal)
                                ("Refresh" . refresh))))))
          (pcase choice
            ('terminal
             (my/treemacs--open-terminal
              (treemacs-project->path
               (car (treemacs-workspace->projects
                     (treemacs-current-workspace))))))
            ('refresh (treemacs-refresh)))))))

  (define-key treemacs-mode-map [mouse-3] #'my/treemacs-rightclick)
  (define-key treemacs-mode-map (kbd "C-c T") #'my/treemacs-terminal-here)

  (with-eval-after-load 'treemacs-evil
    (evil-define-key 'treemacs treemacs-mode-map (kbd "T")
      #'my/treemacs-terminal-here)))

(use-package treemacs-evil
  :after (treemacs evil))

(provide 'init-treemacs)
