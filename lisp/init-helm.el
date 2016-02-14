;; helm configure
(require 'helm-config)
(helm-mode 1)

(key-g "<f12>" 'helm-swoop)

(provide 'init-helm)
