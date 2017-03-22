;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

(require-package 'color-theme-modern)
(load-theme 'clarity t)

;;; Power Line
(require-package 'powerline)
(require 'powerline)
(powerline-default-theme)

;; Provide
(provide 'init-theme)
;;; init-theme.el ends here
