;;; package --- Summary

;;; Commentary:

;;; Code:

;; Hide Show
(require 'func-package)

(require-package 'hideshow)
(require 'hideshow)

(global-set-key (kbd "M-a") 'hs-hide-all)
(global-set-key (kbd "M-q") 'hs-toggle-hiding)

;; Webmode
(add-to-list 'hs-special-modes-alist '(web-mode "<!--\\|<[^/>]*[^/]>\\|{" "-->\\|</[^/>]*[^/]>\\|}"
						"<!--" nil nil))

;; Provide
(provide 'plug-hide-show)
;;; plug-hide-show.el ends here
