(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
  
(package-initialize)

(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
;; (setq cua-keep-region-after-copy t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-linum-mode t) 

(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) ) ; defines M-k as Backward C-k

(global-set-key (kbd "C-w") 'backward-kill-word) ; C-w deletes previous word; just like terminal

(electric-pair-mode 1)

(global-set-key (kbd "C-s") 'save-buffer)
(global-unset-key (kbd "C-x C-s"))
(global-unset-key (kbd "C-x s"))

(global-set-key (kbd "C-f") 'isearch-forward)

(global-set-key (kbd "C-q") 'save-buffers-kill-emacs)
(global-unset-key (kbd "C-x C-c"))

(global-set-key (kbd "C-o") 'find-file)
(global-unset-key (kbd "C-x C-f"))

(global-set-key (kbd "C-z") 'undo)

;; packages

;; NEOTREE
;; $ mkdir ~/.emacs.d/packages/ || cd "$_"
;; $ git clone https://github.com/jaypei/emacs-neotree.git neotree
;; $ cd neotree
;; $ git checkout dev

(add-to-list 'load-path "~/.emacs.d/packages/neotree")
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
