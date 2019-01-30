(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))


(package-initialize)

      
;; list of packages
(setq pkgs '
      (
       nord-theme
       company-irony
       irony
       neotree
       php-mode
       web-mode
       auto-complete
       yasnippet ; yasnippet snippets are now in a seperated package installing that package belowe
       yasnippet-snippets
       ))



(require 'package)
(require 'cl)

(defun install (required-pkgs)
  (setq pkgs-to-install
      (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
        (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))

  (when (> (length pkgs-to-install) 0)
    (package-refresh-contents)
   (dolist (pkg pkgs-to-install)
    (package-install pkg))))



(defun add-to-path-with-subdirs (dir)
  (add-to-list 'load-path dir)
  (--each (f-directories dir) (add-to-list 'load-path it)))

(defun i_man-initialize ()
  (require 'package)

  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "https")))
    ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
    (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
    ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
    (when (< emacs-major-version 24)
      (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
  (package-initialize)
  ;; highlight matching params
  (show-paren-mode 1)

  ;; associating .rs files to rust-mode
  (autoload 'rust-mode "rust-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  
  ;; enabling cua mode // **IMPORTANT**
  (cua-mode t)
  (setq cua-auto-tabify-rectangles nil)
  (transient-mark-mode 1)
  (setq cua-keep-region-after-copy t)

  ;; adding compile/run shortcut
  (global-set-key [f4] 'compile)
  
  ;; making fullscreen on startup
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  
  ;; disabling auto backup files
  (setq make-backup-files nil)
  (setq auto-save-default nil)

  ;; enables the line numbers globally
  (global-linum-mode t) 
 
  ;; Setting default font to Consolas
  (set-face-attribute 'default nil
		      :family "monospace"
		      :height 110
		      :weight 'normal
		      :width 'normal)
  ;; Loading a dark theme
  ;; (load-theme 'deeper-blue) 
  ;; (setq nord-comment-brightness 5)

  
  ;; install missing packages
  (install pkgs)

  (require 'company)
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (global-company-mode)
  )




(i_man-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (irony company-irony company-go company rust-mode nord-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)
(global-set-key (kbd "C-k") 'delete-line-no-kill)


;; (load-theme 'nord t)
;; (setq nord-comment-brightness 20)


(require 'neotree)
(setq-default neo-show-hidden-files t) ; show hidden files (starting with .)
(global-set-key [f8] 'neotree-toggle)

(require 'php-mode)
(eval-after-load 'php-mode
  '(require 'php-ext))

(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) ) ; defines M-k as Backward C-k

(global-set-key (kbd "C-w") 'backward-kill-word) ; C-w deletes previous word; just like terminal

; enabling auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-linum-workaround) ; needed so numbering won't flicker 

(require 'yasnippet)
(yas-global-mode 1)

(setq compile-command "make -C ../ && ../project")
