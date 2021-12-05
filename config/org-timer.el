(require 'org)
(display-time-mode t)
(setq timer-is-on nil)

(defun timer ()
  (interactive)
  (if timer-is-on
      (progn
	(org-timer-stop)
	(setq timer-is-on nil))
    (progn
      (org-timer-start)
      (setq timer-is-on t))
    )
  )
