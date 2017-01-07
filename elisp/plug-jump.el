;; Jump
(require 'func-package)

(require-package 'dumb-jump)

(require 'dumb-jump)

(setq dumb-jump-rg-cmd (expand-file-name "../.cargo/bin/rg" user-emacs-directory))

(global-set-key (kbd "C-.") 'dumb-jump-go)
(global-set-key (kbd "C-,") 'dumb-jump-baxwck)
(global-set-key (kbd "C-/") 'dumb-jump-quick-look)

;; Provide
(provide 'plug-jump)
