;; Elisp Support
(require 'func-package)

(require-package 'elisp-format)
(require-package 'company)
(require-package 'flycheck)
(require-package 'yasnippet)


(add-hook 'emacs-lisp-mode-hook (lambda()
				  ;; (require 'elisp-format)
				  (require 'company)
				  (require 'flycheck)
				  (require 'hideshow)
				  (require 'yasnippet)
				  (company-mode)
				  (flycheck-mode)
				  (add-hook 'before-save-hook (lambda()
								(if (eq major-mode 'emacs-lisp-mode)
								    (elisp-format-buffer) t)))
				  (hs-minor-mode)
				  (yas-minor-mode)))

;; Provide
(provide 'sup-elisp)
