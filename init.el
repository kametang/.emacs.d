;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Custom File
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Basic Settings
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; Package Settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)

;; Time Evaluation
;; (require 'eva-time)

;; General Settings
(require 'init-general)
(require 'init-key)
(require 'init-theme)

;; Package Settings
(require 'plug-helm)
(require 'plug-org)
(require 'plug-window-number)
(require 'plug-flycheck)
(require 'plug-hide-show)
(require 'plug-trim-space)
(require 'plug-anzu)
(require 'plug-jump)
(require 'plug-yasnippet)
(require 'plug-doxy)
(require 'plug-company)

;; Language Support
(require 'sup-common)
(require 'sup-elisp)
(require 'sup-elixir)
(require 'sup-rust)
(require 'sup-c)
(require 'sup-python)
(require 'sup-html)
(require 'sup-go)
(require 'sup-cmake)

;; Provide
(provide 'init)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
