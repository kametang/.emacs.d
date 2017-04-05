;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  elisp-format
  :ensure t
  :functions elisp-format-buffer
  :config (defun local:el-format()
	    "Format Elisp."
	    (when (eq major-mode 'emacs-lisp-mode)
	      (elisp-format-buffer)))
  (add-hook 'before-save-hook 'local:el-format))

(add-hook 'emacs-lisp-mode-hook 'local:common-load)

;; Provide
(provide 'sup-elisp)
;;; sup-elisp.el ends here
