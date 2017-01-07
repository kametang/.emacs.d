;;; package --- Summary

;;; Commentary:

;;; Code:

;; Elisp Support
(require 'func-package)

(require-package 'elisp-format)

(require 'sup-common)

(defun local:elisp-load()
  (local:common-load)
  (add-hook 'before-save-hook (lambda()
				(if (eq major-mode 'emacs-lisp-mode)
				    (elisp-format-buffer)))))

(add-hook 'emacs-lisp-mode-hook 'local:elisp-load)

;; Provide
(provide 'sup-elisp)
;;; sup-elisp.el ends here
