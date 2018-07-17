;; package --- Summary

;;; Commentary:

;;; Code:

;;; ----------------------------------------------------------------- FORMAT --
(require 'clang-format)
(add-hook 'before-save-hook
	  #'(lambda ()
	      (interactive)
	      (when (eq major-mode 'c-mode)
		(clang-format-buffer))))

;;; -------------------------------------------------------------- FONT LOCK --
(require 'preproc-font-lock)
(add-hook 'c-mode-hook #'preproc-font-lock-mode)

;;; --------------------------------------------------------------- KEY BIND --
(add-hook 'c-mode-hook
	  #'(lambda ()
	      (interactive)
	      (local-set-key (kbd "RET")
			     (lambda ()
			       (interactive)
			       (if (nth 4
					(syntax-ppss))
				   (c-indent-new-comment-line)
				 (indent-new-comment-line))))
	      (local-set-key (kbd "M-RET")
			     #'c-indent-new-comment-line)))

;;; ----------------------------------------------------------------- CQUERY --
(require 'cquery)
(when (eq system-type 'gnu/linux)
  (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
  (setq cquery-cache-dir "/tmp/cquery-cached"))
(setq cquery-extra-init-params '(:index (:comments 2)
					:completion (:detailedLabel t):xref
					(:container t)))
(add-hook 'c-mode-hook #'lsp-cquery-enable)


;;; -------------------------------------------------------------- HIGHLIGHT --
;; (add-hook 'hi-lock-mode-hook
;;	  #'(lambda ()
;;	      (interactive)
;;	      (highlight-regexp "/\\* -+ .+ -- \\*/" 'hi-green) ;; Chapter
;;	      (highlight-regexp "/\\* >===== .+ =====< \\*/"
;;				'hi-blue) ;; Section
;;	      ))

;; Provide
(provide 'c-lang)
;;; c-lang.el ends here
