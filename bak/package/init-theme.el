;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  cyberpunk-theme
  :ensure t
  :config (load-theme 'cyberpunk t))

;; Font
(cond ((find-font (font-spec :name "FiraCode"))
       (set-frame-font "FiraCode 18"))
      ((find-font (font-spec :name "Ubuntu Mono"))
       (set-frame-font "Ubuntu Mono 20"))
      ((find-font (font-spec :name "courier"))
       (set-frame-font "courier 18")))

;; (use-package
;;   powerline
;;   :ensure t
;;   :config (powerline-center-theme))

;; Color
;; (use-package
;;   color-identifiers-mode
;;   :diminish color-identifiers-mode
;;   :ensure t
;;   :config (add-hook 'after-init-hook 'global-color-identifiers-mode)
;;   (add-hook 'after-find-file 'color-identifiers:refresh))

;; Provide
(provide 'init-theme)
;;; init-theme.el ends here
