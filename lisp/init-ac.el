;; Company Configure

(require 'company)
(require 'irony)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-transformers (quote (company-sort-by-occurrence)))
(company-flx-mode +1)

(add-hook 'c-mode 'irony-mode)
(add-hook 'c++-mode 'irony-mode)
(add-hook 'cc-mode 'irony-mode)
(add-hook 'irony-mode-hook 'irony-eldoc)

(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook (lambda ()
			      (add-to-list 'company-backends 'company-jedi)))

(provide 'init-ac)
