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
			       (if (or (nth 4
					    (syntax-ppss))
				       (nth 1
					    (syntax-ppss)))
				   (c-indent-new-comment-line)
				 (newline))))))

;;; ----------------------------------------------------------------- CQUERY --
(require 'cquery)
(when (eq system-type 'gnu/linux)
  (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
  (setq cquery-cache-dir "/tmp/cquery-cached"))
(setq cquery-extra-init-params '(:index (:comments 2)
					:completion (:detailedLabel t):xref
					(:container t)))
(add-hook 'c-mode-hook #'lsp-cquery-enable)


;; Provide
(provide 'c-lang)
;;; c-lang.el ends here
