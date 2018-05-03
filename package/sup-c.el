;;; package --- Summary
;;; Commentary:

;;; Code:

;; (use-package
;;   cquery
;;   :ensure t
;;   :functions km-cquery-enable
;;   :config (defun km-cquery-enable()
;; 	    (condition-case nil (lsp-cquery-enable)
;; 	      (user-error
;; 	       nil)))
;;   ;; (setq cquery-executable (expand-file-name "module/cquery/build/release/bin/cquery"
;;   ;; 					    user-emacs-directory))
;;   (setq cquery-executable "/usr/bin/cquery")
;;   (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
;;   (setq cquery-extra-init-params
;; 	'(:index (:comments 2)
;; 		 :extraClangArguments ("--driver-mode=cl")
;; 		 :cacheFormat "msgpack"))
;;   (add-hook 'c-mode-common-hook #'km-cquery-enable))

(use-package
  irony
  :ensure t
  :config (add-hook 'c-mode-common-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package
  irony-eldoc
  :ensure t
  :config (add-hook 'irony-mode-hook #'irony-eldoc))

(use-package
  company-irony
  :ensure t
  :config (add-to-list 'company-backends 'company-irony))

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
	      (align-entire (point-min)
			    (point-max))
	      (clang-format-buffer)))
  (add-hook 'before-save-hook 'local:c-format))

(defun local:c-load()
  (local-set-key (kbd "<C-return>") 'c-indent-new-comment-line)
  (local-set-key (kbd "<M-return>") 'electric-indent-just-newline)
  (setq-default doxymacs-doxygen-style "Qt"))

(add-hook 'c-mode-hook 'local:common-load)
(add-hook 'c-mode-hook 'local:c-load)

;; Provide
(provide 'sup-c)
;;; sup-c.el ends here
