;; package --- Summary

;;; Commentary:

;;; Code:

;; Theme
;; (use-package
;;   moe-theme
;;   :ensure t
;;   :config (load-theme 'moe-dark t)
;;   (moe-theme-set-color 'orange))

(use-package
  grandshell-theme
  :ensure t
  :config (load-theme 'grandshell t))

(set-frame-font "Ubuntu Mono 24")

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
