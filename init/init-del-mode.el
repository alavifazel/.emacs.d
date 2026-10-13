; init-del-mode.el -*- lexical-binding: t; -*-
(define-minor-mode my/del-mode
  "When on, evil deletes (dd, x, D, d{motion}, c) do not touch the clipboard or registers."
  :global t
  :lighter " Del")

(define-advice evil-delete (:around (fn beg end &optional type register yank-handler)
                                    my/blackhole)
  (funcall fn beg end type (if my/del-mode ?_ register) yank-handler))

(global-set-key (kbd "C-c d") #'my/del-mode)

(provide 'init-del-mode)
