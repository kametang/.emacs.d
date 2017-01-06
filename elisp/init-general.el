;; General Settings
(require 'func-package)

;; Environment
(set-language-environment "UTF-8")

;; Functions
(defun kill-buffer-if-exist (buffer)
  "Kill BUFFER if it exist."
  (if (get-buffer buffer)
      (kill-buffer buffer)))

;; Encoding

(add-hook 'find-file-hook (lambda()
			    (unless (member buffer-file-coding-system '(utf-8-unix
									prefer-utf-8-unix))
			      (progn (set-buffer-file-coding-system 'utf-8-unix)
				     (save-buffer)))))

;; InitScreen
(setq inhibit-splash-screen t)

(add-hook 'minibuffer-exit-hook (lambda()
				  (interactive)
				  (kill-buffer-if-exist "*Completions*")
				  (kill-buffer-if-exist "*Help*")))

;; Disable Backup Files
(setq make-backup-files nil backup-by-copying nil version-control nil delete-old-versions t
      auto-save-default nil)

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
