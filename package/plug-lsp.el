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

;; Provide
(provide 'plug-lsp)
;;; plug-lsp.el ends here
