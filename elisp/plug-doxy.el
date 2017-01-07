;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)

;;; Work
(setq exec-path (append exec-path (expand-file-name "doxymacs-code/c" user-emacs-directory)))
(add-to-list 'load-path (expand-file-name "doxymacs-code/lisp" user-emacs-directory))

(require 'doxymacs)

(global-set-key (kbd "<f8>") 'doxymacs-insert-function-comment)

;; Provide
(provide 'plug-doxy)
;;; plug-doxy.el ends here
