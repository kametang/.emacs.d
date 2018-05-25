;; package --- Summary

;;; Commentary:

;;; Code:

;;; -------------------------------------------------------------- FONT LOCK --
(require 'cmake-font-lock)
(add-hook 'cmake-mode-hook #'cmake-font-lock-activate)


;; Provide
(provide 'cmake-lang)
;;; cmake-lang.el ends here
