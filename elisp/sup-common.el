;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'company)
(require-package 'flycheck)
(require-package 'yasnippet)
(require-package 'autopair)
(require-package 'dumb-jump)

;;; Work

;; Company
(defun common:company-load()
  (require 'company)
  (company-mode))

;; Flycheck
(defun common:flycheck-load()
  (require 'flycheck)
  (flycheck-mode))

;; Yasnippet
(defun common:yasnippet-load()
  (require 'yasnippet)
  (yas-minor-mode-on))

;; Dumb Jump
(defun common:dumb-jump-load()
  (require 'dumb-jump)
  (dumb-jump-mode))

;; Fold
(defun common:fold-load()
  (require 'hideshow)
  (hs-minor-mode)
  (hs-hide-all))

;; Autopair
(defun common:autopair-load()
  (require 'autopair)
  (autopair-mode))

;; Load
(defun local:common-load()
  (common:company-load)
  (common:dumb-jump-load)
  (common:flycheck-load)
  (common:yasnippet-load)
  (common:fold-load)
  (common:autopair-load))

;; Provide
(provide 'sup-common)
;;; sup-common.el ends here
