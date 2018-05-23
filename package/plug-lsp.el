;; package --- Summary

;;; Commentary:

;;; Code:

;; LSP
(use-package
  lsp-mode
  :ensure t)

;; LSP ui
(use-package
  lsp-ui
  :ensure t
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Company
(use-package
  company-lsp
  :ensure t
  :config (setq company-lsp-cache-candidates nil)
  (setq company-lsp-async nil)
  (add-hook 'lsp-mode-hook (lambda()
			     (add-to-list 'company-backends 'company-lsp))))

;; Provide
(provide 'plug-lsp)
;;; plug-lsp.el ends here
