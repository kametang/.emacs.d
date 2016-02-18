;; helm configure
(require 'helm-config)
(helm-mode 1)

(key-g "C-t" 'helm-swoop)

(provide 'init-helm)
