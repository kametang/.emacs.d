;; Trim Space
(require 'func-package)

(require-package 'ethan-wspace)

(require 'ethan-wspace)

(global-ethan-wspace-mode 1)

(setq-default ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
(setq-default show-trailing-whitespace nil)

(add-hook 'before-save-hook 'ethan-wspace-clean-all)

;; Provide
(provide 'plug-trim-space)
