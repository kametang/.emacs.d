;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  company-jedi
  :ensure t
  :init (setq-default jedi:complete-on-dot t)
  (setq-default jedi:use-shortcuts t)
  (setq-default jedi:tooltip-method t)
  :config (require 'jedi-core)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-to-list 'company-backends 'company-jedi))

(use-package
  flycheck-pyflakes
  :ensure t)

(add-hook 'python-mode-hook 'local:common-load)

;; Provide
(provide 'sup-python)
;;; sup-python.el ends here
