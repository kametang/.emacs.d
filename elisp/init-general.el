;;; package --- Summary

;;; Commentary:

;;; Code:

;; General Settings
(require 'func-package)

;; Environment
(set-language-environment "UTF-8")

;; Functions
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Disable Backup Files
(setq make-backup-files nil backup-by-copying nil version-control nil delete-old-versions t
      auto-save-default nil)

;; Remove additional bar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Show parens
(require-package 'mic-paren)
(require 'mic-paren)
(paren-activate)
(setq paren-highlight-offscreen t)

;; Highlight Line
(global-hl-line-mode t)
(set-face-background 'hl-line "white")
(set-face-foreground 'hl-line "black")

;; Line Number
(global-linum-mode t)

;; Ruler
(column-number-mode t)
(line-number-mode t)

;; Provide
(provide 'init-general)
;;; init-general.el ends here
