;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  dumb-jump
  :ensure t
  :config (dumb-jump-mode)
  (when (bound-and-true-p ivy-mode)
    (setq dumb-jump-selector 'ivy))
  (setq dumb-jump-prefer-searcher 'rg)
  (setq dumb-jump-aggressive nil)
  :bind (("<f3>" . dumb-jump-go)
	 ("<f4>" . dumb-jump-back)))

;; Provide
(provide 'plug-jump)
;;; plug-jump.el ends here
