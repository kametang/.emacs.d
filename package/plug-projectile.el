;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  projectile
  :ensure t
  :config (projectile-mode))

(use-package
  helm-projectile
  :ensure t
  :bind ("C-o" . helm-projectile-find-file))



;; Provide
(provide 'plug-projectile)
;;; plug-projectile.el ends here
