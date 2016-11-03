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

;; Trim Wspace
(require 'init-ws)

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

;; Folding
(require 'init-fold)

;; Indent Guide
(require 'init-indent-guide)

;; Emacs general settings
(require 'init-settings)

;; Elixir
(require 'init-elixir)
;; No settings

;; Load theme
(load-theme 'monokai t)

;; Emacs general key bind
(require 'init-key)

;; Shell
(require 'init-shell)

(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t :inherit default :background "white" :foreground "black")))
 '(company-tooltip-common ((t :inherit font-lock-constant-face)))
 '(company-tooltip-selection ((t :inhert font-lock-constant-face :foreground "black" :background "green"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vue-mode yasnippet undo-tree sphinx-doc smex smartparens projectile move-text monokai-theme markdown-mode js2-mode irony-eldoc indent-guide ido-yes-or-no ido-vertical-mode ido-occur highlight-symbol header2 grizzl git-gutter flycheck-pyflakes flycheck-irony flx-ido expand-region ethan-wspace company-jedi company-irony company-flx clang-format alchemist))))
