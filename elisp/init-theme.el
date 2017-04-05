;; package --- Summary

;;; Commentary:

;;; Code:

;; Theme
(use-package color-theme-modern
  :ensure t
  :config
  (load-theme 'billw t))

(use-package helm-themes
  :ensure t
  :config
  (helm-themes--load-theme "billw"))

;; Power Line
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Provide
(provide 'init-theme)
;;; init-theme.el ends here
