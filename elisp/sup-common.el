;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'company)
(require-package 'flycheck)
(require-package 'yasnippet)
(require-package 'dumb-jump)
(require-package 'eldoc)
(require-package 'anzu)

(require 'company)
(require 'flycheck)
(require 'yasnippet)
(require 'dumb-jump)
(require 'hideshow)
(require 'eldoc)
(require 'electric)
(require 'anzu)

;;; Work

;; Company
(defun common:company-load()
  (company-mode))

;; Flycheck
(defun common:flycheck-load()
  (flycheck-mode))

;; Yasnippet
(defun common:yasnippet-load()
  (yas-minor-mode)
  (yas-reload-all))

;; Dumb Jump
(defun common:dumb-jump-load()
  (dumb-jump-mode))

;; Fold
(defun common:fold-load()
  (hs-minor-mode))

;; Autopair
(defun common:autopair-load()
  (electric-pair-mode))

;; Eldoc
(defun common:eldoc-load()
  (eldoc-mode))

;; Anzu
(defun common:anzu-load()
  (anzu-mode +1))

(defvar local:load-list
  '((complete common:company-load)
    (snippet  common:yasnippet-load)
    (lint  common:flycheck-load)
    (fold  common:fold-load)
    (autopair  common:autopair-load)
    (jump  common:dumb-jump-load)
    (doc common:eldoc-load)
    (sr common:anzu-load)))

(defvar local:ll)

;; Load
(defun local:common-load
    (&optional
     ignore-list)
  "Common Load Function.  IGNORE-LIST for skip some special module."
  (unless (listp ignore-list)
    (setq ignore-list '(empty)))
  (setq-local local:ll (copy-alist local:load-list))
  (dolist (item ignore-list)
    (assq-delete-all item local:ll))
  (dolist (kf local:ll)
    (apply (cdr kf))))

(provide 'sup-common)
;;; sup-common.el ends here
