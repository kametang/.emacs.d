;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'func-package)

(require-package 'helm)
(require-package 'helm-themes)

(require 'helm)
(require 'helm-config)
(require 'helm-themes)

;; Settings
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

;; Theme
(helm-themes--load-theme "clarity")

;; Key Maps
(global-set-key (kbd "C-p") 'switch-to-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Extension
(require-package 'helm-ls-git)
(require 'helm-ls-git)
(global-set-key (kbd "C-o") 'helm-browse-project)

;; Occur
(global-set-key (kbd "C-f") 'helm-occur)

;; IMenu
(global-set-key (kbd "<f5>") 'helm-imenu)

;; Mode ON
(helm-mode 1)

(provide 'plug-helm)
;;; plug-helm.el ends here
