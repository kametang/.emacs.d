;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'cmake-mode)
(require 'cmake-mode)

;;; Work
(setq auto-mode-alist (append '(("CMakeLists\\.txt\\'". cmake-mode)
				("\\.cmake\\'" .cmake-mode)) auto-mode-alist))

;; Provide
(provide 'sup-cmake)
;;; sup-cmake.el ends here
