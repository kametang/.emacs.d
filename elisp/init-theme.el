;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'monokai-theme)

;;; Work
(load-theme 'monokai t)

;;; Power Line
(require-package 'powerline)
(require 'powerline)
(if (eq system-type 'cygwin)
    (powerline-vim-theme)
  (powerline-default-theme))

;; Provide
(provide 'init-theme)
;;; init-theme.el ends here
