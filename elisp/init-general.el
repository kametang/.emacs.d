;;; package --- Summary

;;; Commentary:

;;; Code:

;; Environment
(set-language-environment "UTF-8")
(setq enable-local-variables
      :all)

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
(use-package
  mic-paren
  :ensure t
  :config (setq paren-highlight-offscreen t)
  (setq paren-highlight-at-point t)
  (paren-activate))

;; Highlight Line
(global-hl-line-mode t)
(set-face-background 'hl-line "white")
(set-face-foreground 'hl-line "black")

;; Line Number
(global-linum-mode t)

;; Ruler
(column-number-mode t)
(line-number-mode t)

;; Disable cache
(setq cache-long-scans nil)

;; Always center
(use-package
  centered-cursor-mode
  :ensure t
  :config (global-centered-cursor-mode t))

;; Fonts
(when (not(eq window-system 'nul))
  (set-frame-font "Inconsolata 18"))

;; Provide
(provide 'init-general)
;;; init-general.el ends here
