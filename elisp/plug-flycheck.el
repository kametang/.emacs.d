;; package --- Summary

;;; Commentary:

;;; Code:

(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-default flycheck-highlighting-mode 'lines)
  (setq-default flycheck-display-errors-function 'ignore)
  (setq-default flycheck-emacs-lisp-load-path 'inherit)
  :functions (flycheck-list-errors flycheck-error-list-goto-error)
  :config
  (defun umkm:flycheck-open()
    "open flycheck error list"
    (interactive)
    (flycheck-list-errors)
    (other-window 1))
  (defun umkm:flycheck-go()
    "go error"
    (interactive)
    (flycheck-error-list-goto-error)
    (delete-other-windows))
  :bind (("<f12>" . umkm:flycheck-open)
	 :map flycheck-error-list-mode-map
	 ("RET" .  umkm:flycheck-go)))


;; Provide
(provide 'plug-flycheck)
;;; plug-flycheck.el ends here
