;; Elisp Support
(require 'func-package)

(require-package 'elisp-format)
(require-package 'company)
(require-package 'flycheck)

(require 'elisp-format)
(require 'company)
(require 'flycheck)
(require 'hideshow)

(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'before-save-hook (lambda()
							  (if (eq major-mode 'emacs-lisp-mode)
								  (elisp-format-buffer) t)))
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;; Provide
(provide 'sup-elisp)
