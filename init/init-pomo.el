(defvar my/pomo-file (expand-file-name "~/.pomodoro-count"))
(defvar my/pomo-count
  (if (file-exists-p my/pomo-file)
      (string-to-number
       (with-temp-buffer ; creates a temp buffer, runs the expressions in order, returns the value of the last one
         (insert-file-contents my/pomo-file) ; puts the file's text in the temp 'buffer'
         (buffer-string))) ; returns the text in the temp buffer as a string
    0))

; var(s) used for the pomodoro timer
(defvar my/pomo-left 0)
(defvar my/pomo-paused nil)
(defvar my/pomo-string "")

(defun my/pomo-tick ()
  (when (and (> my/pomo-left 0) (not my/pomo-paused))
    (setq my/pomo-left (1- my/pomo-left))
    (when (= my/pomo-left 0)
      (ding)
      (setq my/pomo-count (1+ my/pomo-count))
      (with-temp-file my/pomo-file
        (insert (number-to-string my/pomo-count)))
      (message "Pomodoro done! Total: %d" my/pomo-count)))
  (setq my/pomo-string
        (format " %s✔%d "
                (if (> my/pomo-left 0)
                    (format "%s %02d:%02d  "
                            (if my/pomo-paused "⏸" "»")
                            (/ my/pomo-left 60) (% my/pomo-left 60))
                  "")
                my/pomo-count))
  (force-mode-line-update t))

(defun my/pomodoro ()
  (interactive)
  (setq my/pomo-left (* 20 60) my/pomo-paused nil))

(defun my/pomodoro-toggle ()
  (interactive)
  (setq my/pomo-paused (not my/pomo-paused)))

(run-with-timer 0 1 #'my/pomo-tick)
(add-to-list 'global-mode-string 'my/pomo-string t)

(setq global-mode-string
      (seq-remove (lambda (x) (and (consp x) (eq (car x) :eval)))
                  global-mode-string))
(add-to-list 'global-mode-string '(:eval my/pomo-string) t)

(provide 'init-pomo)
