;; C/C++
(require 'func-package)

(require-package 'company)
(require-package 'irony)
(require-package 'company-irony)
(require-package 'irony-eldoc)
(require-package 'clang-format)

(eval-after-load 'c-mode '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'c++-mode '(add-to-list 'company-backends 'company-irony))

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'irony-eldoc)
(add-hook 'c-mode-hook (lambda ()
						 (setq-local indent-tabs-mode nil)))
(add-hook 'before-save-hook (lambda()
							  (if (or (eq major-mode 'c-mode)
									  (eq major-mode 'c++-mode))
								  (clang-format-buffer))))

(setq-default tab-width 4)
(setq clang-format-executable "clang-format")

;; Provide
(provide 'sup-c)
