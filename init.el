;;; package --- Summery
;;; Commentary:

;;; Code:
;; Setting Dir

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Plugins Initialization
(require 'init-package)

;; Emacs general key functions
(require 'init-key-func)

;; ido Configure
(require 'init-ido)

;; smex Configure
(require 'init-smex)

;; Company Configure
(require 'init-ac)

;; Redo
(require 'init-redo)

;; Shell
(require 'init-shell)

;; Yasnippet
(require 'init-snippet)

;; Comment Setting
(require 'init-comment)

;; Format Settings
(require 'init-format)

;; Syntax Check
(require 'init-check)

;; Projectile
(require 'init-project)

;; Emacs general settings
(require 'init-settings)

;; Emacs general key bind
(require 'init-key)

;; No settings

;; Load theme
(load-theme 'monokai t)

(global-git-gutter-mode +1)

(require 'smartparens-config)
(add-hook 'find-file-hook 'smartparens-mode)

(provide 'init)
;;; init.el ends here
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
