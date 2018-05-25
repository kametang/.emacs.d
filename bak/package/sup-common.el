;; package --- Summary

;;; Commentary:

;;; Code:
(use-package
  electric
  :diminish electric-pair-mode
  :ensure t
  :config (electric-pair-mode))

(use-package
  eldoc
  :diminish eldoc-mode
  :ensure t)

;;; Work

;; Flycheck
(defun common:flycheck-load()
  (flycheck-mode))

;; Yasnippet
(defun common:yasnippet-load()
  (yas-minor-mode))

;; Dumb Jump
;;(defun common:dumb-jump-load()
;;  (dumb-jump-mode))

;; Eldoc
(defun common:eldoc-load()
  (eldoc-mode))

;; Anzu
(defun common:anzu-load()
  (anzu-mode +1))

;; Company
(defun common:company-load()
  (company-mode))

(defvar local:load-list
  '((snippet  common:yasnippet-load)
    (lint  common:flycheck-load)
    ;;   (jump  common:dumb-jump-load)
    (comp common:company-load)
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
