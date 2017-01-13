;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-eldoc)

;;; Work
(require 'sup-common)
(require 'go-mode)
(require 'company-go)
(require 'go-eldoc)

(defun local:go-load()
  (local:common-load)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (set (make-local-variable 'company-backends)
       '(company-go))
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'local:go-load)
;; Provide
(provide 'sup-go)
;;; sup-go.el ends here
