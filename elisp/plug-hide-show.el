;; Hide Show
(require 'func-package)

(require-package 'hideshow)
(require 'hideshow)

(global-set-key (kbd "M-a") 'hs-hide-all)
(global-set-key (kbd "M-q") 'hs-toggle-hiding)

;; Provide
(provide 'plug-hide-show)
