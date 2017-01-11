;;; package --- Summary

;;; Commentary:

;;; Code:

;; Jump
(require 'func-package)

(require-package 'dumb-jump)

(require 'dumb-jump)

(if (eq system-type 'cygwin)
    (progn
      (setq dumb-jump-ag-cmd "ag")
      (setq dumb-jump-rg-cmd "echo")
      (setq dumb-jump-max-find-time 10))
  (setq dumb-jump-rg-cmd (expand-file-name "../.cargo/bin/rg" user-emacs-directory)))

(global-set-key (kbd "<f3>") 'dumb-jump-go)
(global-set-key (kbd "<f4>") 'dumb-jump-back)
(global-set-key (kbd "C-\\") 'dumb-jump-quick-look)

;; Provide
(provide 'plug-jump)
;;; plug-jump.el ends here
