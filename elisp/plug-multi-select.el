;; Multi Select
(require 'func-package)

(require-package 'multiple-cursors)

(require 'multiple-cursors)

(global-set-key (kbd "C-d") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-x C-d") 'multiple-cursors-mode)

;; Provide
(provide 'plug-multi-select)
