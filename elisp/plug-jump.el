;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  dumb-jump
  :ensure t
  :config (setq dumb-jump-rg-cmd (expand-file-name "../.cargo/bin/rg" user-emacs-directory))
  (when (eq system-type 'cygwin)
    (progn
      (setq dumb-jump-ag-cmd "ag")
      (setq dumb-jump-rg-cmd "echo")
      (setq dumb-jump-max-find-time 10)))
  (when (eq system-type 'windows-nt)
    (setq dumb-jump-rg-cmd (expand-file-name "../../../.cargo/bin/rg" user-emacs-directory)))
  :bind (("<f3>" . dumb-jump-go)
	 ("<f4>" . dumb-jump-back)))

;; Provide
(provide 'plug-jump)
;;; plug-jump.el ends here
