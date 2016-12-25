;; Python
(require 'func-package)

(require-package 'company)
(require-package 'company-jedi)
(require-package 'flycheck-pyflakes)

(require 'company)
(require 'jedi-core)
(require 'flycheck-pyflakes)

(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(setq jedi:tooltip-method t)

(add-hook 'python-mode-hook (lambda()
							  (jedi:setup)
							  (add-to-list 'company-backends 'company-jedi)))

;; Provide
(provide 'sup-python)
