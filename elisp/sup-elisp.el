;; Elisp Support
(require 'func-package)

(require-package 'elisp-format)

(defun local:elisp-load()
  (require 'sup-common)
  (local:common-load)
  (add-hook 'before-save-hook (lambda()
				(if (eq major-mode 'emacs-lisp-mode)
				    (elisp-format-buffer)))))

(add-hook 'emacs-lisp-mode-hook 'local:elisp-load)

;; Provide
(provide 'sup-elisp)
