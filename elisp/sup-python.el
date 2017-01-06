;; Python
(require 'func-package)

(require-package 'company-jedi)
(require-package 'flycheck-pyflakes)

(defun local:python-load()
  (require 'sup-common)
  (local:common-load)
  (require 'jedi-core)
  (require 'flycheck-pyflakes)
  (setq-default jedi:complete-on-dot t)
  (setq-default jedi:use-shortcuts t)
  (setq-default jedi:tooltip-method t)
  (jedi:setup)
  (add-to-list 'company-backends 'company-jedi))


(add-hook 'python-mode-hook 'local:python-load)

;; Provide
(provide 'sup-python)
