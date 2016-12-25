;; General Settings
(require 'func-package)

;; Functions
(defun kill-buffer-if-exist (buffer)
  "Kill Buffer if it exist"
  (if (get-buffer buffer)
      (kill-buffer buffer)))

;; Auto Close unnecessary buffer
(setq-default message-log-max nil)
(setq-default messages-buffer-max-lines nil)
(setq initial-scratch-message "")

(kill-buffer-if-exist "*Messages*")
(add-hook 'after-change-major-mode-hook (lambda ()
					  (interactive)
					  (kill-buffer-if-exist "*scratch*")
					  (kill-buffer-if-exist "*Backtrace*")))
(add-hook 'minibuffer-exit-hook (lambda()
				  (interactive)
				  (kill-buffer-if-exist "*Completions*")
				  (kill-buffer-if-exist "*Help*")
				  (kill-buffer-if-exist "*Messages*")))

;; Disable Backup Files
(setq make-backup-files nil backup-by-copying nil version-control nil delete-old-versions t
      auto-save-default nil)

;; Force new end-of-line
(setq mode-require-final-newline t)

;; Remove additional bar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Show parens
(show-paren-mode 1)

;; Highlight Line
(global-hl-line-mode t)
(set-face-background 'hl-line "grey")

;; Line Number
(global-linum-mode t)

;; Ruler
(column-number-mode t)
(line-number-mode t)

;; Suppress Warning
(require 'warnings)
(setq warning-minimum-level
      :emergency)

;; Indent Guide
(require-package 'indent-guide)
(require 'indent-guide)
(indent-guide-global-mode)

(set-face-foreground 'indent-guide-face "pink")
(set-face-background 'indent-guide-face "black")

(setq enable-local-eval t)

;; Provide
(provide 'init-general)
