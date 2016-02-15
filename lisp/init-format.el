;; C format settings
(setq-default indent-tabs-mode nil)
(setq tab-width 4
      c-basic-offset 4)
;; Clang format
(require 'clang-format)

(setq clang-format-executable "clang-format-3.6")

(add-hook 'before-save-hook (lambda ()
			      (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
				  (clang-format-buffer))))
(provide 'init-format)
