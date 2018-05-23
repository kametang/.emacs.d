;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Custom File
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))
(load custom-file)

;; Basic Settings
(add-to-list 'load-path (expand-file-name "package" user-emacs-directory))

;; Package Settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Use-package Init
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(use-package
  diminish
  :ensure t)
(use-package
  bind-key
  :ensure t)

;; Time Evaluation
;; (require 'eva-time)

;; General Settings
(require 'init-general)
(require 'init-key)
(require 'init-theme)

;; Package Settings
;; (require 'plug-helm)
(require 'plug-ivy)
;; (require 'plug-ffip)
(require 'plug-projectile)
(require 'plug-flycheck)
(require 'plug-trim-space)
(require 'plug-anzu)
(require 'plug-jump)
(require 'plug-doxy)
(require 'plug-company)
(require 'plug-yasnippet)
(require 'plug-lsp)
(require 'plug-git)
(require 'plug-fold)

;; Language Support
(require 'sup-common)
(require 'sup-elisp)
(require 'sup-c)
;;(require 'sup-python)
;;(require 'sup-go)
(require 'sup-cmake)

;; Provide
(provide 'init)
;;; init.el ends here
