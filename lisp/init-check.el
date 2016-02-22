(require 'flycheck)
(global-flycheck-mode)
(require 'flycheck-irony)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(provide 'init-check)