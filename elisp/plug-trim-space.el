;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  ethan-wspace
  :diminish ethan-wspace-mode
  :ensure t
  :config (setq-default ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
  (setq-default show-trailing-whitespace nil)
  (setq-default mode-require-final-newline nil)
  :config (add-hook 'before-save-hook 'ethan-wspace-clean-all)
  (global-ethan-wspace-mode 1))

;; Provide
(provide 'plug-trim-space)
;;; plug-trim-space.el ends here
