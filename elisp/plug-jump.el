;; Jump
(require 'func-package)

(require-package 'dumb-jump)

(require 'dumb-jump)

(setq-default dumb-jump-rg-cmd "C:\\Users\\DennyChang\\.cargo\\bin\\rg.exe")

(global-set-key (kbd "C-.") 'dumb-jump-go)
(global-set-key (kbd "C-,") 'dumb-jump-back)
(global-set-key (kbd "C-_") 'dumb-jump-quick-look)

;; Provide
(provide 'plug-jump)
