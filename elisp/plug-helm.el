;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'func-package)

(require-package 'helm)

(require 'helm)
(require 'helm-config)

;; Settings
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

;; Key Maps
(global-set-key (kbd "C-p") 'switch-to-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Extension
(require-package 'helm-ls-git)
(require 'helm-ls-git)
(global-set-key (kbd "C-o") 'helm-browse-project)

;; Mode ON
(helm-mode 1)

(provide 'plug-helm)
;;; plug-helm.el ends here
