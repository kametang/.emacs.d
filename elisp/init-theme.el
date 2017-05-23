;; package --- Summary

;;; Commentary:

;;; Code:

;; Theme
(use-package
  moe-theme
  :ensure t
  :config (load-theme 'moe-light t)
  (moe-theme-set-color 'orange))

;; Power Line
(use-package
  powerline
  :ensure t
  :config (if (functionp 'powerline-moe-theme)
	      (powerline-moe-theme)
	    (powerline-default-theme)))

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
