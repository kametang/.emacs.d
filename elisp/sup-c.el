;;; package --- Summary
;;; Commentary:

;;; Code:

(use-package
  irony
  :ensure t
  :config (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-hook 'irony-mode))

(use-package
  irony-eldoc
  :ensure t
  :config (add-hook 'irony-mode-hook 'irony-eldoc))

(use-package
  company-irony
  :ensure t
  :config (setq company-irony-ignore-case t)
  (add-to-list 'company-backends 'company-irony))

(use-package
  flycheck-irony
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package
  clang-format
  :ensure t
  :functions read-clang-format-config
  :init (defun read-clang-format-config()
	  (with-temp-buffer (insert-file-contents (expand-file-name "clang-format.json"
								    user-emacs-directory))
			    (replace-regexp-in-string "\n" "" (buffer-string))))
  (setq-default clang-format-style (read-clang-format-config))
  (setq-default clang-format-executable "clang-format")
  :config (defun local:c-format()
	    "Format C File"
	    (when (eq major-mode 'c-mode)
	      (clang-format-buffer)))
  (add-hook 'before-save-hook 'local:c-format))

(defun local:c-load()
  (local-set-key (kbd "<C-return>") 'c-indent-new-comment-line)
  (setq-local doxymacs-doxygen-style "C++"))

(add-hook 'c-mode-hook 'local:common-load)
(add-hook 'c-mode-hook 'local:c-load)

;; Provide
(provide 'sup-c)
;;; sup-c.el ends here
