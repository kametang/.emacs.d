;; Company Configure

(require 'company)
<<<<<<< HEAD
(require 'irony)
=======
>>>>>>> aef5241... feat(init): first commit
(add-hook 'after-init-hook 'global-company-mode)

(setq company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-transformers (quote (company-sort-by-occurrence)))

<<<<<<< HEAD
(add-hook 'c-mode 'irony-mode)
(add-hook 'c++-mode 'irony-mode)
(add-hook 'cc-mode 'irony-mode)
(add-hook 'irony-mode-hook 'irony-eldoc)

=======
>>>>>>> aef5241... feat(init): first commit
(provide 'init-ac)
