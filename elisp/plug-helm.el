;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  :config
  (helm-mode 1)
  :bind (
	 ("C-p" . switch-to-buffer)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-f" . helm-occur)
	 ("<f5>" . helm-imenu)
	 )
  )

(use-package helm-ls-git
  :ensure t
  :bind ("C-o" . helm-browse-project))

(provide 'plug-helm)
;;; plug-helm.el ends here
