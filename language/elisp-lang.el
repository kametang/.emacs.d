;; package --- Summary

;;; Commentary:

;;; Code:

;;; ----------------------------------------------------------------- FORMAT --
(require 'srefactor)
(require 'srefactor-lisp)

(add-hook 'before-save-hook
	  #'(lambda ()
	      (interactive)
	      (when (equal major-mode 'emacs-lisp-mode)
		(srefactor-lisp-format-buffer))))


;;; -------------------------------------------------------------- FONT LOCK --
(require 'lisp-extra-font-lock)
(add-hook 'emacs-lisp-mode-hook #'lisp-extra-font-lock-mode)


;;; --------------------------------------------------------------- FLYCHECK --
(setq flycheck-emacs-lisp-load-path 'inherit)

;; Provide
(provide 'elisp-lang)
;;; elisp-lang.el ends here
