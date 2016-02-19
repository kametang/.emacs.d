;; Emacs general settings

;; Disable startup splash screen
(setq inhibit-startup-screen t)

;; Disable backup files
(setq
 make-backup-files nil
 backup-by-copying nil
 version-control nil
 delete-old-version t
 auto-save-default nil)

;; Remove new line at end of file
(setq mode-require-final-newline nil)

;; Remove menubar, toolbar and scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Set Auto-fill mode
(setq-default fill-column 79)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show parens
(show-paren-mode 1)

;; Highlight line
(global-hl-line-mode t)

;; Line Number
(global-linum-mode t)

;; Ruler
(dolist (mode '(column-number-mode line-number-mode))
  (when (fboundp mode) (funcall mode t)))
		
;; Setting English font
(if (member "Input" (font-family-list))
    (set-face-attribute
     'default nil :font "Input 12"))

;; Set folding
(defun hsmode()
  (hs-minor-mode)
  (hs-hide-all))
;;; Hook
(add-hook 'c-mode-hook 'hsmode)
(add-hook 'c++-mode-hook 'hsmode)
(add-hook 'emacs-lisp-mode-hook 'hsmode)
(add-hook 'python-mode-hook 'hsmode)

(provide 'init-settings)
