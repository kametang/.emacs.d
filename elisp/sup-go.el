;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  go-mode
  :ensure t
  :config (add-hook 'before-save-hook 'gofmt-before-save))

(use-package
  go-eldoc
  :ensure t
  :config (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package
  company-go
  :ensure t
  :config (add-hook 'go-mode-hook (lambda()
				    (set (make-local-variable 'company-backends)
					 '(company-go)))))

(add-hook 'go-mode-hook 'local:common-load)
;; Provide
(provide 'sup-go)
;;; sup-go.el ends here
