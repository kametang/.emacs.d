;; Multi Select
(require 'func-package)

(require-package 'multiple-cursors)

(require 'multiple-cursors)

(global-set-key (kbd "<f3>") 'mc/mark-next-like-this)
(global-set-key (kbd "<f4>") 'multiple-cursors-mode)

;; Provide
(provide 'plug-multi-select)
