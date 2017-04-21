;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package
  helm
  :ensure t
  :init (require 'helm-config)
  (setq-default helm-mode-fuzzy-match t)
  (setq-default helm-completion-in-region-fuzzy-match t)
  :config (helm-mode 1)
  (setq-default helm-boring-buffer-regexp-list (append helm-boring-buffer-regexp-list '("\\*")))
  :bind (("C-p" . helm-mini)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-f" . helm-occur)
	 ("<f5>" . helm-imenu)))

(provide 'plug-helm)
;;; plug-helm.el ends here
