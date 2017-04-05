;; package --- Summary

;;; Commentary:

;;; Code:

(use-package alchemist
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode))

(add-hook 'elixir-mode-hook 'local:common-load)

;; Provide
(provide 'sup-elixir)
;;; sup-elixir.el ends here
