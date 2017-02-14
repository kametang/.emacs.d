;;; package --- Summary
;;; Commentary:
;;; Code:

;; IDo
(require 'func-package)

(require 'ido)
(ido-mode t)
(ido-everywhere 1)

(require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;; Provide
(provide 'plug-ido)
;;; plug-ido.el ends here
