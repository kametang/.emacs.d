;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  dumb-jump
  :ensure t
  :config (if (eq system-type 'windows-nt)
	      (setq dumb-jump-rg-cmd (expand-file-name "../../../.cargo/bin/rg"
						       user-emacs-directory))
	    (setq dumb-jump-rg-cmd (expand-file-name "../.cargo/bin/rg" user-emacs-directory)))
  (when (bound-and-true-p helm-mode)
    (setq dumb-jump-selector 'helm))
  (setq dumb-jump-force-searcher 'rg)
  (setq dumb-jump-aggressive nil)
  :bind (("<f3>" . dumb-jump-go)
	 ("<f4>" . dumb-jump-back)))

;; Provide
(provide 'plug-jump)
;;; plug-jump.el ends here
