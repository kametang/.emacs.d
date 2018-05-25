;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  flx
  :ensure t)

(use-package
  smex
  :ensure t)

(use-package
  counsel
  :ensure t
  :config (ivy-mode 1)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-use-selectable-prompt t)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-p" . counsel-ibuffer)
	 ("<f5>" . counsel-imenu)))

(use-package
  swiper
  :ensure t
  :bind (("C-s" . swiper)))



;; Provide
(provide 'plug-ivy)
;;; plug-ivy.el ends here
