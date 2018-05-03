;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  color-theme-sanityinc-tomorrow
  :ensure t
  :config (load-theme 'sanityinc-tomorrow-bright t))

(set-frame-font "FiraCode 18")

(use-package
  powerline
  :ensure t
  :config (powerline-center-theme))

;; Color
(use-package
  color-identifiers-mode
  :diminish color-identifiers-mode
  :ensure t
  :config (add-hook 'after-init-hook 'global-color-identifiers-mode)
  (add-hook 'after-find-file 'color-identifiers:refresh))

;; Provide
(provide 'init-theme)
;;; init-theme.el ends here
