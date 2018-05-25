;; package --- Summary

;;; Commentary:

;;; Code:

;;; ------------------------------------------------------- INSTALL PACKAGES --
(umkm/ensure-packages 'elisp-format ;; Format
		      )


;;; ----------------------------------------------------------------- FORMAT --
(add-hook 'before-save-hook #'(lambda() 
				(interactive) 
				(when (= major-mode emacs-lisp-mode) 
				  (elisp-format-buffer))))

;; Provide
(provide 'elisp-lang)
;;; elisp-lang.el ends here
