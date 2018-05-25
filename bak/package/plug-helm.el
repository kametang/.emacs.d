;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package
  helm
  :diminish helm-mode
  :ensure t
  :init (require 'helm-config)
  (setq-default helm-mode-fuzzy-match t)
  (setq-default helm-completion-in-region-fuzzy-match t)
  :config (helm-mode 1)
  :bind (("C-p" . helm-buffers-list)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x C-o" . helm-occur)
	 ("<f5>" . helm-imenu)))

(provide 'plug-helm)
;;; plug-helm.el ends here
