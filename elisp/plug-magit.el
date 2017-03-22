;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'magit)

;;; Work
(require 'magit)

(global-set-key (kbd "<f11>") 'magit-status)

;; Provide
(provide 'plug-magit)
;;; plug-magit.el ends here
