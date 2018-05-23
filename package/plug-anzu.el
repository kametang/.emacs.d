;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  anzu
  :diminish anzu-mode
  :ensure t
  :bind (("C-b" . isearch-backward)
	 ("C-f" . isearch-forward)
	 ("C-r" . anzu-query-replace-regexp)
	 ("C-x C-r" . anzu-query-replace-at-cursor)))

;; Provide
(provide 'plug-anzu)
;;; plug-anzu.el ends here
