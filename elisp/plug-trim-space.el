;; Trim Space
(require 'func-package)

(require-package 'ethan-wspace)

(require 'ethan-wspace)

(setq-default ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
(setq-default show-trailing-whitespace nil)
(setq-default mode-require-final-newline nil)

(add-hook 'before-save-hook 'ethan-wspace-clean-all)

(global-ethan-wspace-mode 1)

;; Provide
(provide 'plug-trim-space)

