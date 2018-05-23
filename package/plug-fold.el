;; package --- Summary

;;; Commentary:

;;; Code:


(use-package
  yafolding
  :ensure t
  :config (yafolding-mode)
  :bind (("C-x C-_" . yafolding-toggle-element)
	 ("C-x C-h" . yafolding-hide-all)))


;; Provide
(provide 'plug-fold)
;;; plug-fold.el ends here
