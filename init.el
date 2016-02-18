;;; package --- Summery
;;; Commentary:

;;; Code:
;; Setting Dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Plugins Initialization
(require 'init-package)

;; Emacs general key functions
(require 'init-key-func)

;; Helm Configure
(require 'init-helm)

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

;; Emacs general settings
(require 'init-settings)

;; Emacs general key bind
(require 'init-key)

;; No settings

;; Load theme
(load-theme 'monokai t)

(global-git-gutter-mode +1)

(provide 'init)
;;; init.el ends here
