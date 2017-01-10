;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'anzu)

;;; Work
(global-set-key (kbd "C-b") 'isearch-backward)
(global-set-key (kbd "C-r") 'anzu-query-replace-regexp)

;; Provide
(provide 'plug-anzu)
;;; plug-anzu.el ends here
